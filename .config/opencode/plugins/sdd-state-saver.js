export const SddStateSaver = async ({ client }) => {
  return {
    "experimental.session.compacting": async (input, output) => {
      try {
        // 1. Buscar cambio SDD activo en memory
        const activeChange = await client.memory.search_nodes({ 
          query: "sdd-change" 
        })
        
        if (activeChange.entities.length > 0) {
          const changeName = activeChange.entities[0].name
          
          // 2. Obtener detalles del cambio
          const changeDetails = await client.memory.open_nodes({
            names: [changeName]
          })
          
          // 3. Extraer archivos trabajados del contexto reciente
          const workedFiles = extractWorkedFiles(input.context)
          
          // 4. Extraer decisiones clave
          const keyDecisions = extractKeyDecisions(changeDetails)
          
          // 5. Guardar en memory ANTES de compactar
          await client.memory.add_observations({
            observations: [{
              entityName: changeName,
              contents: [
                `pre-compaction-backup: ${new Date().toISOString()}`,
                `files-worked: ${workedFiles.join(', ')}`,
                `key-decisions: ${keyDecisions.join('; ')}`,
                `context-size-before: ${input.contextLength} tokens`
              ]
            }]
          })
          
          // 6. Inyectar contexto en prompt de compaction
          output.context.push(`
## SDD Estado Actual (PRE-COMPACTION):
- Cambio activo: ${changeName}
- Archivos modificados: ${workedFiles.length > 0 ? workedFiles.join(', ') : 'ninguno'}
- Decisiones clave: ${keyDecisions.length > 0 ? keyDecisions.join('; ') : 'ninguna'}
- Estado: En progreso (no archivado)

PRESERVAR ESTA INFORMACIÓN en el resumen compactado.`)
        }
      } catch (error) {
        // Si falla, no bloquear la compactación
        await client.app.log({
          body: {
            service: "sdd-state-saver",
            level: "warn",
            message: `Error saving state before compaction: ${error.message}`
          }
        })
      }
    }
  }
}

// Helpers
function extractWorkedFiles(context) {
  // Extraer archivos de tool calls recientes (edit, write, patch, read)
  const filePattern = /["']([^"']*\.(ts|js|tsx|jsx|md|yaml|yml|json))["']/g
  const matches = [...context.matchAll(filePattern)]
  const files = matches.map(m => m[1])
  
  // También buscar patrones de path
  const pathPattern = /([a-zA-Z0-9_/-]+\.(ts|js|tsx|jsx|md|yaml|yml|json))/g
  const pathMatches = [...context.matchAll(pathPattern)]
  const paths = pathMatches.map(m => m[1])
  
  // Unir y eliminar duplicados
  const allFiles = [...files, ...paths]
  return [...new Set(allFiles)].slice(0, 15)
}

function extractKeyDecisions(changeDetails) {
  // Extraer observaciones que contengan "key-decision", "approved" o "decision"
  const observations = changeDetails.entities[0]?.observations || []
  return observations
    .filter(obs => 
      obs.toLowerCase().includes('key-decision') || 
      obs.toLowerCase().includes('approved') ||
      obs.toLowerCase().includes('decision')
    )
    .slice(0, 5)
}

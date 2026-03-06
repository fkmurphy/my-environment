export const VoiceNotification = async ({ $, client }) => {
  const isQuiet = process.env.OPENCODE_QUIET === '1'
  const noVoice = process.env.OPENCODE_NO_VOICE === '1'
  
  if (isQuiet || noVoice) {
    return {}
  }
  
  const config = {
    voices: {
      success: "Flo (Español (México))",
      error: "Grandpa (Español (México))",
      info: "Eddy (Español (México))",
      permission: "Reed (Español (México))"
    },
    messages: {
      sessionIdle: [
        "Sesión completada",
        "Tarea finalizada",
        "Trabajo terminado"
      ],
      sessionError: [
        "Hay un error en la sesión",
        "La sesión encontró un problema",
        "Error detectado"
      ],
      toolAfter: {
        "sdd-apply": "Implementación completada",
        "sdd-verify": "Verificación finalizada",
        "sdd-archive": "Cambio archivado"
      },
      permission: {
        "bash": "Permiso de terminal solicitado",
        "edit": "Permiso de edición solicitado",
        "write": "Permiso de escritura solicitado",
        "patch": "Permiso de modificación solicitado",
        "read": "Permiso de lectura solicitado",
        "default": "Permiso solicitado"
      }
    }
  }
  
  const randomMessage = (arr) => arr[Math.floor(Math.random() * arr.length)]
  
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        const message = randomMessage(config.messages.sessionIdle)
        await client.app.log({
          body: {
            service: "voice-notification",
            level: "info",
            message: `Playing idle notification: ${message}`
          }
        })
        await $`say -v "${config.voices.success}" "${message}"`
      }
      
      if (event.type === "session.error") {
        const message = randomMessage(config.messages.sessionError)
        await client.app.log({
          body: {
            service: "voice-notification",
            level: "info",
            message: `Playing error notification: ${message}`
          }
        })
        await $`say -v "${config.voices.error}" "${message}"`
      }
      
      if (event.type === "tool.execute.after") {
        const sddTools = ["sdd-apply", "sdd-verify", "sdd-archive"]
        const toolName = event.tool
        
        if (sddTools.includes(toolName)) {
          const message = config.messages.toolAfter[toolName] || "Tarea finalizada"
          await client.app.log({
            body: {
              service: "voice-notification",
              level: "info",
              message: `Playing tool notification for ${toolName}: ${message}`
            }
          })
          await $`say -v "${config.voices.info}" "${message}"`
        }
      }
      
      if (event.type === "permission.asked") {
        const permissionType = event.permission || "default"
        const message = config.messages.permission[permissionType] || config.messages.permission.default
        
        await client.app.log({
          body: {
            service: "voice-notification",
            level: "info",
            message: `Playing permission notification: ${message}`
          }
        })
        await $`say -v "${config.voices.permission}" "${message}"`
      }
    }
  }
}

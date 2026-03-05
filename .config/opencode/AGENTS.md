# Preferencias de Código - Global

## Stack Tecnológico
- **Backend**: Node.js/TypeScript
- **Database**: PostgreSQL
- **CI/CD**: GitHub Actions

## Estándares de Código

### Naming Conventions
- `camelCase` para variables y funciones
- `PascalCase` para clases y tipos
- Nombres descriptivos en lugar de abreviaturas

### Programación Funcional
- Preferir métodos funcionales: `map`, `filter`, `reduce`, `forEach`
- Evitar loops tradicionales: `for`, `while`, `do-while`

### TypeScript
- **Nunca** usar tipo `any`
- Usar `unknown` solo cuando sea estrictamente necesario
- Preferir tipos específicos y bien definidos
- Usar tipos de unión e intersección cuando corresponda

### Comentarios y Documentación
- NO agregar comentarios salvo que la lógica sea compleja o no obvia
- Solo comentar cuando sea realmente necesario
- No agregar docstrings automáticamente a funciones existentes
- El código debe ser auto-explicativo con buenos nombres

## Seguridad
- Validar todas las entradas de usuario
- NO leer archivos `.env` o con credenciales
- No commitear secretos o keys
- Usar variables de entorno para configuración sensible

## Git
- Commits descriptivos
- Revisar cambios antes de commitear

## Testing y Linting
- `yarn test` - ejecutar todos los tests del proyecto
- `yarn lint` - ejecutar linter del proyecto

## MCP Tools
- Usar `context7` para documentación de librerías
- Usar `memory` para contexto persistente entre sesiones

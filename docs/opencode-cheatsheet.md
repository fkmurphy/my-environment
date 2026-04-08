# OpenCode Cheatsheet

## ⚠️ IMPORTANTE

Iniciar opencode en tmux con `--port`:

```bash
opencode --port
```

Sin esto el plugin no detecta la instancia.

## Keybindings

| Keymap | Acción |
|--------|--------|
| `<leader>oa` | Preguntar sobre archivo o selección (@this) |
| `<leader>oq` | Preguntar sin contexto (solo pregunta libre) |
| `<leader>os` | Seleccionar prompt predefinido (explicar, refactorear...) |
| `<leader>o+` | Agregar contexto sin enviar pregunta |
| `<leader>ot` | Abrir/cerrar terminal embebida |
| `<leader>on` | Nueva sesión (/session new) |
| `<leader>oi` | Interrumpir (/session interrupt) |
| `<leader>oc` | Compactar sesión (/session compact) |
| `<leader>oA` | Cambiar agente (/agent cycle) |

## Placeholders útiles

- `@this` → Archivo actual o selección visual
- `@buffer` → Contenido del buffer
- `@selection` → Solo selección visual
- `@diagnostics` → Errores LSP
- `@diff` → Git diff

## Ver también

- [TMUX Cheatsheet](./tmux-cheatsheet.md) - Configuración de tmux requerida para OpenCode

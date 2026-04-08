# TMUX Cheatsheet

## Integración con Neovim

Este cheatsheet cubre la configuración de tmux utilizada junto con Neovim.

## Navegación entre paneles (vim-tmux-navigator)

| Keybinding | Descripción |
|------------|-------------|
| `Ctrl+h` | Ir a panel izquierda |
| `Ctrl+j` | Ir a panel abajo |
| `Ctrl+k` | Ir a panel arriba |
| `Ctrl+l` | Ir a panel derecha |
| `Ctrl+\` | Ir al panel anterior |

> **Nota**: La navegación con `Ctrl+h/j/k/l` funciona seamlessly entre vim y tmux gracias al plugin `vim-tmux-navigator`.

## Gestión de ventanas/paneles (prefix = Ctrl+a)

| Keybinding | Descripción |
|------------|-------------|
| `prefix + \|` | Split vertical |
| `prefix + -` | Split horizontal |
| `prefix + \` | Split vertical con focus |
| `prefix + _` | Split horizontal con focus |
| `prefix + c` | Nueva ventana |
| `prefix + n` | Siguiente ventana |
| `prefix + p` | Ventana anterior |
| `prefix + R` | Renombrar ventana |
| `prefix + z` | Zoom/unzoom panel |
| `prefix + b` | Break pane a nueva ventana |
| `prefix + H/J/K/L` | Resize panel (5 celdas) |
| `prefix + G` | Join pane horizontal (mover a otra ventana) |
| `prefix + O` | Join pane vertical (mover a otra ventana) |
| `prefix + <` | Swap ventana anterior |
| `prefix + >` | Swap ventana siguiente |

## Sesiones

| Keybinding | Descripción |
|------------|-------------|
| `prefix + S` | Selector de sesiones |
| `prefix + Ctrl+c` | Nueva sesión |
| `prefix + r` | Recargar configuración |

## Copy mode (VI style)

| Keybinding | Descripción |
|------------|-------------|
| `prefix + [` | Entrar a copy mode |
| `v` | Iniciar selección |
| `y` | Copiar y salir |
| `Ctrl+K` | Limpiar historial |

## Popup

| Keybinding | Descripción |
|------------|-------------|
| `prefix + F` | Abrir popup (ventana flotante) |

## Otros

| Keybinding | Descripción |
|------------|-------------|
| `prefix + Ctrl+s` | Sincronizar paneles (para comandos paralelos) |
| `prefix + a` | Enviar prefix a tmux anidado |

## Plugins instalados

- **vim-tmux-navigator**: Navegación fluida vim/tmux
- **tmux-yank**: Copiar al portapapeles del sistema
- **tmux-open**: Abrir URLs/archivos en copy mode
- **tmux-pain-control**: Gestión de splits mejorada
- **tmux-resurrect**: Guardar/restaurar sesiones
- **tmux-continuum**: Auto-save de sesiones
- **dracula/tmux**: Tema visual

## Ver también

- [Neovim Cheatsheet](./nvim-cheatsheet.md) - Keybindings de Neovim
- [OpenCode Cheatsheet](./opencode-cheatsheet.md) - Comandos de OpenCode (requiere tmux)

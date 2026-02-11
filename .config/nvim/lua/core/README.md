# Cheatsheet: LSP + Treesitter + Aerial + Plugins + OpenCode

## LSP (Language Server Protocol)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>gd` | Goto Definition |
| `<leader>pd` | Peek Definition (abre en vsplit) |
| `<leader>gr` | References (busca donde se usa) |
| `<leader>lo` | Document Symbols (Telescope treesitter) |
| `<leader>ws` | Workspace Symbols |
| `K` | Hover (muestra documentación) |
| `<leader>ca` | Code Action (sugerencias para arreglar errores) |
| `<leader>rn` | Rename (renombrar variable/función) |
| `<leader>e` | Line diagnostics (ver error actual) |
| `<leader>ge` | Next diagnostic (siguiente error) |
| `<leader>gp` | Prev diagnostic (error anterior) |
| `<leader>ke` | Diagnostics loclist (lista todos los errores) |
| `<leader>gI` | LSP Implementations |
| `<leader>gt` | Type Definitions |

## FOLDING (Treesitter)

| Keybinding | Descripción |
|------------|-------------|
| `za` | Toggle fold (abrir/cerrar función actual) |
| `zM` | Close all folds (cerrar todas las funciones) |
| `zR` | Open all folds (abrir todas las funciones) |
| `zm` | Close fold one level |
| `zr` | Open fold one level |

## AERIAL (Outline/Árbol de código)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>o` | Toggle Outline (abre/cierra panel lateral) |
| `{` | AerialPrev (ir a función anterior) |
| `}` | AerialNext (ir a función siguiente) |

## TELESCOPE (Búsquedas)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>f` | Find Files |
| `<leader>b` | Buffers |
| `<leader>fg` | Live Grep (buscar texto) |
| `<leader>gr` | LSP References |
| `<leader>gd` | LSP Definitions |
| `<leader>lo` | Treesitter Symbols (outline en Telescope) |
| `<leader>ws` | Workspace Symbols |

## GIT (Gitsigns + Fugitive)

| Comando/Keybinding | Descripción |
|-------------------|-------------|
| `:Gitsigns diff` | Ver diff del archivo |
| `:Gvdiff` o `:Gdiff` | Ver diff en vertical con Fugitive |
| `]c` | Next hunk (siguiente cambio) |
| `[c` | Prev hunk (cambio anterior) |

## NVIM-TREE (Explorador de archivos)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>n` | Toggle NvimTree |
| `a` | Create file/folder |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `R` | Refresh |

## OTROS ÚTILES

| Keybinding | Descripción |
|------------|-------------|
| `<leader>w` | Guardar archivo |
| `<leader>q` | Salir |
| `<leader>h` | Limpiar búsqueda (nohlsearch) |
| `Ctrl+h/j/k/l` | Navegar entre ventanas |
| `<leader>vr` | Resize vertical |

## TESTING (vim-test)

| Keybinding | Descripción |
|------------|-------------|
| `t<C-n>` | Run nearest test |
| `t<C-f>` | Run current file |
| `t<C-s>` | Run test suite |
| `t<C-l>` | Run last test |

## DEBUGGING (DAP)

| Keybinding | Descripción |
|------------|-------------|
| `<F5>` | Continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

## OPENCODE

### ⚠️ IMPORTANTE

Iniciar opencode en tmux con `--port`:

```bash
opencode --port
```

Sin esto el plugin no detecta la instancia.

### Keybindings

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

### Placeholders útiles

- `@this` → Archivo actual o selección visual
- `@buffer` → Contenido del buffer
- `@selection` → Solo selección visual
- `@diagnostics` → Errores LSP
- `@diff` → Git diff

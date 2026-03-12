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

## GLANCE (Peek Definitions/References)

| Keybinding | Descripción |
|------------|-------------|
| `gpd` | Peek definition (preview sin saltar) |
| `gpr` | Peek references |
| `gpi` | Peek implementations |
| `gpt` | Peek type definitions |

## INC-RENAME (Preview de rename)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>cr` | Rename con preview (muestra cuántas instancias cambiarán) |

## FOLDING (Treesitter)

| Keybinding | Descripción |
|------------|-------------|
| `za` | Toggle fold (abrir/cerrar función actual) |
| `zM` | Close all folds (cerrar todas las funciones) |
| `zR` | Open all folds (abrir todas las funciones) |
| `zm` | Close fold one level |
| `zr` | Open fold one level |

## NAVEGACIÓN ENTRE FUNCIONES (Treesitter Textobjects)

| Keybinding | Descripción |
|------------|-------------|
| `]m` | Ir a la siguiente función (inicio) |
| `[m` | Ir a la función anterior (inicio) |
| `]M` | Ir al final de la siguiente función |
| `[M` | Ir al final de la función anterior |
| `]c` | Ir a la siguiente clase |
| `[c` | Ir a la clase anterior |
| `vif` | Seleccionar contenido interno de función |
| `vaf` | Seleccionar toda la función (incluyendo declaración) |
| `vic` | Seleccionar contenido interno de clase |
| `vac` | Seleccionar toda la clase |

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

## FLASH (Navegación rápida)

| Keybinding | Descripción |
|------------|-------------|
| `ss` | Saltar a cualquier parte del código |
| `st` | Saltar usando treesitter (funciones, clases) |

## YANKY (Historial del portapapeles)

| Keybinding | Descripción |
|------------|-------------|
| `p` | Pegar (con historial) |
| `P` | Pegar antes (con historial) |
| `<c-n>` | Siguiente item del historial (después de pegar) |
| `<c-p>` | Item anterior del historial |
| `<leader>sp` | Abrir historial de yanks en Telescope |

## HARPOON (Archivos favoritos)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>haa` | Agregar archivo actual a harpoon |
| `<leader>hah` | Abrir menú de harpoon |
| `<leader>ha1` | Ir al archivo 1 |
| `<leader>ha2` | Ir al archivo 2 |
| `<leader>ha3` | Ir al archivo 3 |
| `<leader>ha4` | Ir al archivo 4 |

## TROUBLE (Diagnósticos)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>xx` | Toggle Trouble (lista de diagnósticos) |
| `<leader>xd` | Diagnósticos del documento actual |
| `<leader>xw` | Diagnósticos del workspace |
| `<leader>xl` | Loclist |
| `<leader>xq` | Quickfix |

## TODO-COMMENTS

| Keybinding | Descripción |
|------------|-------------|
| `<leader>st` | Buscar todos los TODOs/FIXMEs del proyecto |

## GIT (Neogit + Diffview + Gitsigns)

### Neogit

| Keybinding | Descripción |
|------------|-------------|
| `<leader>gs` | Status (abre Neogit) |
| `<leader>gc` | Commit |
| `<leader>gp` | Push |
| `<leader>gl` | Log |

### Diffview

| Keybinding | Descripción |
|------------|-------------|
| `<leader>gdo` | Abrir diff (comparar con HEAD) |
| `<leader>gdc` | Cerrar diff |
| `<leader>gdr` | Refresh diff |
| `<leader>gdh` | Historial del archivo actual |
| `<leader>gdH` | Historial de la rama |

### Gitsigns

| Keybinding | Descripción |
|------------|-------------|
| `]h` | Siguiente hunk (cambio) |
| `[h` | Hunk anterior |
| `<leader>hp` | Preview hunk (flotante) |
| `<leader>hb` | Blame line |
| `<leader>hB` | Toggle blame virtual text |
| `<leader>hd` | Diff this |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |

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

## SESSION MANAGER

| Keybinding | Descripción |
|------------|-------------|
| `<leader>sl` | Load session (cargar sesión guardada) |
| `<leader>ss` | Save session (guardar sesión actual) |
| `<leader>sd` | Delete session (borrar sesión) |
| `<leader>sf` | Load current dir session (cargar sesión del directorio actual) |
| `<leader>ll` | Save session and quit (guardar y cerrar todo) |

### Uso de Session Manager

1. **Primera vez en un proyecto**: Abre los archivos/pestañas que quieras y ejecuta `<leader>ss` para guardar la sesión
2. **Auto-carga**: La próxima vez que abras nvim en ese directorio, se restaurará automáticamente
3. **Listar sesiones**: Usa `<leader>sl` para ver todas las sesiones guardadas y elegir una

## TESTING (Neotest)

| Keybinding | Descripción |
|------------|-------------|
| `<leader>tt` | Ejecutar test más cercano al cursor |
| `<leader>tT` | Ejecutar todos los tests del archivo |
| `<leader>td` | Debug test (con DAP) |
| `<leader>ts` | Toggle summary panel |
| `<leader>to` | Mostrar output del test |
| `<leader>tO` | Toggle output panel flotante |
| `<leader>tS` | Detener tests en ejecución |
| `<leader>tw` | Toggle watch mode (re-ejecuta al guardar) |
| `]t` | Ir al siguiente test fallido |
| `[t` | Ir al test fallido anterior |

## DEBUGGING (DAP)

| Keybinding | Descripción |
|------------|-------------|
| `<F5>` | Continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

## MARKDOWN PREVIEW (render-markdown.nvim)

| Keybinding | Descripción |
|------------|-------------|
| `:MarkdownRenderToggle` | Activar/desactivar preview |
| `:MarkdownRender` | Forzar renderizado |

El preview se activa automáticamente al abrir archivos `.md`.

## OTROS ÚTILES

| Keybinding | Descripción |
|------------|-------------|
| `<leader>w` | Guardar archivo |
| `<leader>q` | Salir |
| `<leader>cl` | Limpiar búsqueda (nohlsearch) |
| `Ctrl+h/j/k/l` | Navegar entre ventanas |
| `<leader>vr` | Resize vertical |

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
# Plugins nvim

## Packer.nvim
install
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Requirements
For [`telescope.nvim` package](https://github.com/nvim-telescope/telescope.nvim), install [ripgrep](https://github.com/BurntSushi/ripgrep#installation)

```sh
brew install ripgrep stylua
```

Install `fd`
```sh
brew install fd
```

Install LSP typescript
```sh
npm install -g typescript typescript-language-server
```

Install prettierd
```
brew install fsouza/prettierd/prettierd
```

Add coredll (rust)
```
:MasonInstall codelldb
```

Fonts

https://www.nerdfonts.com/font-downloads
> recommend font: Hack Nerd Font https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip

# Verify health
```
:checkhealth
```


## Cheatsheet

READ cheatsheet zimfw https://zimfw.sh/docs/cheatsheet/

Leader key = space

### LSP

**Suggestions**
`<Leader> ca` Code actions, replacement suggestions (icon 💡)

**Replace var name**
`<Leader> rn`

**Save and quit**
`<Leader> w` save

`<Leader q` quit

**Show me help**
`<Shift + k>`


### Surround
**Wrap quotes, parenthessis and others**
`Shift + s`

### Debugger (DAP UI)
**Run or debug function**
`<Leader> k`

**Set breakpoint**
`<Leader> dt`

**Terminate debug**
`<Leader> dx`

**Terminate debug**
`<Leader> dx`

### NVIM Tree
**Open directory**
`<Leader> nt`

**Help**
`g?`

**Refresh**
`<Shift> + r`

**Rename**
`r`

**Open in new tab**
`<Ctrl> + T`

**Open split vertical**
`<Ctrl> + V`

**Open split horizontal**
`<Ctrl> + X`

### Telescope (search)

**Search files**
`<Leader> + f`

**Search in buffer**
`<Leader> + b`

### Change TAB
**Next tab**
`gt`

**Prev tab**
`gT`

### No search (highlight)
`<Leader> + h`

## Snippets [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
You can use snippets, for example:
`html5` --> generate html template

## Formatter
Use formatter for nvim with `prettierd`

## Bugs

Currently i have a bug with the [highlight limit](https://github.com/neovim/neovim/blob/e6ff154be6da8bd53b604fb6e38686acae75b24f/src/nvim/syntax.c#L101). Check this:
```
:hi OR :verbose hi
:hi clear
```

I think it's possible that the dracula theme generates too many lines (highlighted lines).
Check another theme `gruvbox`. And review `:colorscheme gruvbox`

### tree-sitter executable not found?
```
brew install tree-sitter
```

### vim-fugitive (git commit gpg) for mac
Install
```
brew install pinentry-mac
```

Create new file `~/.gnupg/gpg-agent.conf`
```
pinentry-program /usr/local/bin/pinentry-mac
```

Add to `.zshrc`
```sh
GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_CURSES=1"
```

Restart gpg-agent
```sh
gpgconf --kill gpg-agent
```

---

# Lara Microservices - OpenCode Configuration

Configuration for OpenCode agents and code style when working on Lara microservices.

## Quick Start

### 1. Install direnv (macOS)

```bash
brew install direnv
```

### 2. Add direnv Hook to Shell

Add to `~/.zshrc` (or `~/.bash_profile` for bash):

```bash
eval "$(direnv hook zsh)"
```

Reload shell:

```bash
source ~/.zshrc
```

### 3. Create `.envrc` in Lara Directory

```bash
cd ~/dev/lara
cat > .envrc << 'EOF'
export OPENCODE_CONFIG_DIR=~/my-environment/lara
EOF
```

### 4. Authorize `.envrc`

```bash
direnv allow ~/dev/lara
```

### 5. Verify Setup

```bash
cd ~/dev/lara
echo $OPENCODE_CONFIG_DIR  # Should print: ~/my-environment/lara
```

## Alternative: Symbolic Link Setup

If you prefer not to use direnv, you can use a symbolic link:

```bash
# Remove any existing .opencode
rm -rf ~/dev/lara/.opencode

# Create symlink
ln -s ~/my-environment/lara ~/dev/lara/.opencode
```

## Directory Structure

```
my-environment/lara/
├── .git/
├── .gitignore
├── AGENTS.md                      # Workflows and procedures
├── opencode.json                  # OpenCode agents config
└── skills/
    └── lara-code-style/
        └── SKILL.md               # Code style guide
```

## What's Included

- **opencode.json**: Defines `lara-back` and `lara-front` agents
- **AGENTS.md**: Services, commands, Docker setup, migrations
- **skills/lara-code-style/SKILL.md**: Complete code style for TypeScript (backend + frontend)

## Updating Configuration

```bash
cd ~/my-environment/lara
git add .
git commit -m "your message"
git push origin main
```

## Troubleshooting

**direnv not working?**
- Verify hook is in your shell config: `grep direnv ~/.zshrc`
- Reload shell: `source ~/.zshrc`
- Re-authorize: `direnv allow ~/dev/lara`

**OpenCode not finding config?**
- Check symlink/env var: `echo $OPENCODE_CONFIG_DIR` or `ls -la ~/dev/lara/.opencode`
- Restart OpenCode session if configuration is cached

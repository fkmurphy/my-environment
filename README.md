# My Environment Configuration

This repository contains personalized environment configurations.

## Directory Structure

```
my-environment/
├── .config/
│   ├── opencode/             # OpenCode configuration (versioned)
│   │   ├── config.json
│   │   └── .gitignore        # Excludes: node_modules, package.json, bun.lock
│   └── nvim/                 # Neovim configuration
├── lara-env/                 # Lara microservices OpenCode config (separate private repo)
│   ├── .git/
│   ├── AGENTS.md
│   ├── opencode.json
│   ├── skills/
│   └── README.md
├── .zshenv
├── .zshrc
└── README.md                 # This file
```

## Repositories

### my-environment (this repo)
**GitHub**: https://github.com/fkmurphy/my-environment

Main environment configuration including:
- OpenCode global configuration
- Neovim configuration
- Shell configuration (.zshrc, .zshenv)

Setup symlink for OpenCode:
```bash
ln -s ~/my-environment/.config/opencode ~/.config/opencode
```

### lara-env
**GitHub**: https://github.com/fkmurphy/lara-env (Private)

Lara-specific OpenCode configuration (agents, skills, workflows).

Setup symlink:
```bash
ln -s ~/my-environment/lara-env ~/dev/lara/.opencode
```

## Making Changes

```bash
cd ~/my-environment
git add .
git commit -m "your message"
git push
```

For Lara-specific changes:
```bash
cd ~/my-environment/lara-env
git add .
git commit -m "your message"
git push
```

## Local Environment Variables

Create `~/.zshenv.local` for sensitive or machine-specific variables that should NOT be versioned in git.

### Setup

1. Create the file:
```bash
touch ~/.zshenv.local
chmod 600 ~/.zshenv.local
```

2. Add your variables:
```bash
# Example variables
export AZURE_OPENAI_API_KEY="your-key-here"
export LANGSMITH_API_KEY="your-key-here"
export DATABASE_URL="postgres://..."
export GITHUB_TOKEN="your-token-here"
```

The `~/.zshenv` in this repository automatically sources `~/.zshenv.local` if it exists.

### Example `.zshenv.local`

See `zshenv.local.example` in this repository for a template with common variables.

### Important

- Never commit `.zshenv.local` to git
- Keep sensitive credentials in this file
- Use `chmod 600` to restrict file permissions
- Add to your `.gitignore_global` if you use it

---

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
```sh
brew install fsouza/prettierd/prettierd
```

Add coredll (rust)
```sh
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

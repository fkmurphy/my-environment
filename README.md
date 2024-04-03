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
brew install ripgrep
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

# Verify health
```
:checkhealth
```



## Cheatsheet

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

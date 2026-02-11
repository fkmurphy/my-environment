vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.encoding = "utf-8"
vim.opt.guifont = "DroidSansMNerdFontComplete_Nerd_Font"
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.relativenumber = true
vim.opt.shell = "zsh"
vim.o.showmode = false
vim.opt.clipboard = "unnamed"
vim.opt.mouse = "a"
vim.opt.re = 0
vim.opt.redrawtime = 10000
vim.opt.updatetime = 300
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- use spaces for tabs and whatnot
vim.o.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- set sw, tabstop to 2 - js ts and html
vim.cmd([[
  autocmd FileType javascript,typescript,html setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
endif
]])

vim.opt.swapfile = false

--Line numbers
vim.wo.number = true

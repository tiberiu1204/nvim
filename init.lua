require("config")
require("after.plugins")

function Set_tab(arg)
	vim.opt.tabstop = arg
	vim.opt.shiftwidth = arg
end

Set_tab(2)

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.g.mapleader = " "

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

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.o.completeopt = "menuone,noselect"


-- Define a function to enable and disable eventignore
function ToggleBufWritePreIgnore(enable)
	if enable then
		vim.cmd("set eventignore=BufWritePre")
		print("BufWritePre events are now ignored.")
	else
		vim.cmd("set eventignore=")
		print("BufWritePre events are now enabled.")
	end
end

vim.api.nvim_create_user_command('FormatOff', function()
	ToggleBufWritePreIgnore(true)
end, {})

vim.api.nvim_create_user_command('FormatOn', function()
	ToggleBufWritePreIgnore(false)
end, {})

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Set tab size to 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Ensure proper indentation for new lines
vim.o.autoindent = true
vim.o.smartindent = true
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "►", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "", linehl = "", numhl = "" })

-- Function to set transparency for all window elements
local function set_transparent_background()
  local highlight_groups = {
    "Normal",
    "NonText",
    "LineNr",
    "Folded",
    "EndOfBuffer",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "VertSplit",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "CursorLineNR",
    "Pmenu",
    "PmenuSel",
  }
  for _, group in ipairs(highlight_groups) do
    vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
  end
end

-- Set transparency initially
set_transparent_background()

-- Ensure transparency is applied on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_transparent_background,
})

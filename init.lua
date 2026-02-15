-- [[ 1. Basic Settings ]]
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.tabstop = 2               -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 2           -- Number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 2            -- Number of spaces to use for each step of (auto)indent
vim.opt.number = true             -- Print the line number in front of each line
vim.opt.relativenumber = true     -- Show relative line numbers for easier jumping
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard (Copy/Paste with Mac)
vim.opt.smartindent = true        -- Insert indents automatically when starting a new line
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors in the TUI (Better for Catppuccin)

-- [[ 2. Bootstrap lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- [[ 3. Mapleader ]]
vim.g.mapleader = " "

-- [[ 4. Plugin Management ]]
require("lazy").setup("plugins")

-- [[ 5. Final Theme & Keymaps ]]
vim.cmd.colorscheme "catppuccin-mocha"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

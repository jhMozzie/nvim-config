-- [[ 1. Basic Settings ]]
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

-- [[ 2. Bootstrap lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- [[ 3. Mapleader ]]
vim.g.mapleader = " "

-- [[ 4. Plugin Management ]]
require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        -- Usamos pcall para evitar que el error bloquee el editor si el módulo no está listo
        local status, configs = pcall(require, "nvim-treesitter.configs")
        if not status then return end
        configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "css" },
          highlight = { enable = true },
        })
      end
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
      config = function()
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
      end
    },
  }
})

-- [[ 5. Final Theme & Keymaps ]]
vim.cmd.colorscheme "catppuccin-mocha"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

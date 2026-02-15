return {
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

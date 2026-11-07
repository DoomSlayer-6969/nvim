return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")   
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      telescope.load_extension("fzf")
      
      telescope.setup({
        defaults = {
          path_display = { "smart" },
          scroll_strategy = "limit",
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
        },
        extensions = {
          themes = {
            enable_previewer = true,
            enable_live_previewer = true,
            persist = {
              enabled = true,
              path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
            },
          },
        },
      })

      -- keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep "})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    end,
}

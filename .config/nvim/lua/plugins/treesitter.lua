return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            local builtin = require("telescope.builtin")

            vim.keymap.set('n', '<C-p>', builtin.find_files, {})                        -- search for files
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})                    -- fuzzy grep for a string in all files
            vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})     -- reveal filesystem to the left

            config.setup({
                auto_install = true,
                ensure_installed = { "rust", "lua", "typescript", "javascript" },
                autotag = { enale = true },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}

return {
        {
            "sam4llis/nvim-tundra",
            config = function()
                require('nvim-tundra').setup({
                    plugins = {
                        lsp = true,
                        treesitter = true,
                        cmp = true,
                        context = true,
                        dbui = false,
                        gitsigns = true,
                        telescope = true
                    },
                    syntax = {
                        booleans = { bold = true, italic = true },
                        comments = { italic = true },
                        types = { italic = true },
                        constants = { bold = true }
                    }
                })
            end,
            enabled = false,
        },
        -- {
        --     "LazyVim/LazyVim",
        --     opts = {
        --         colorscheme = "tundra",
        --     },
        -- },
}

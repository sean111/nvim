return {
    { "sainnhe/everforest" },
    {
        "sam4llis/nvim-tundra",
        config = function()
            require("nvim-tundra").setup({
                sidebars = {
                    enabled = true,
                    color = nil,
                },
                plugins = {
                    lsp = true,
                    treesitter = true,
                    cmp = true,
                    context = true,
                    dbui = false,
                    gitsigns = true,
                    telescope = true,
                },
                syntax = {
                    booleans = { bold = true, italic = true },
                    comments = { italic = true },
                    types = { italic = true },
                    constants = { bold = true },
                },
            })
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                options = {
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        types = "italic,bold",
                    }
                }
            })
        end
    },
}

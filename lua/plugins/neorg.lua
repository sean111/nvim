return {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    -- config = function()
    --     require("config.neorg")
    -- end,
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        work = "~/Documents/notes/work",
                    },
                },
            },
        },
    },
    dependencies = "nvim-lua/plenary.nvim"
}

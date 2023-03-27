return {
    "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "LukasPietzschmann/telescope-tabs",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            {
                "nvim-telescope/telescope-project.nvim",
                cmd = "Telescope project",
                config = function()
                    require('telescope').load_extension("project")
                end,
            },
            {
                "jvgrootveld/telescope-zoxide",
                cmd = "Telescope zoxide",
                config = function()
                    require('telescope').load_extension("zoxide")
                end,
            },
        },
        config = function()
            require("config.telescope")
        end,
}
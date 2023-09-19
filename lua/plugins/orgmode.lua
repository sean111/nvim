return {
    "nvim-orgmode/orgmode",
    config = function()
        require("config.orgmode")
    end,
    dependencies = {

        "lukas-reineke/headlines.nvim",
    },
}
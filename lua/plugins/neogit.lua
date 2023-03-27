return {
    "TimUntersberger/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    config = function()
        require("config.neogit")
    end,
}
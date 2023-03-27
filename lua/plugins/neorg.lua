return {
    "nvim-neorg/neorg",
    config = function()
        require("config.neorg")
    end,
    requires = "nvim-lua/plenary.nvim"
}
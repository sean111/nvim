return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "RRethy/nvim-treesitter-textsubjects",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-context",
        "p00f/nvim-ts-rainbow",
        "nvim-treesitter/playground",
        "chrisgrieser/nvim-various-textobjs",
        "tedkulp/telescope-tele-tabby.nvim",
    },
    run = ":TSUpdate",
    config = function()
        require("config.treesitter")
    end
}
return {
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
        enabled = false
    },
    {
        'echasnovski/mini.surround',
        version = false,
        config = function()
            require('mini.surround').setup()
        end
    },
}


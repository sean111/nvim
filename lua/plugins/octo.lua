return {
    'pwntester/octo.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
        'almo7aya/openingh.nvim',
    },
    cmd = "Octo",
    config = function()
        require("config.octo")
    end
}
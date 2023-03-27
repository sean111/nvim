return {
    'VonHeikemen/lsp-zero.nvim',
    event = "BufRead",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "lukas-reineke/lsp-format.nvim" },
        { "nvim-lua/lsp-status.nvim" },
        { url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", name = "lsp_lines", },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-emoji" },
        { "f3fora/cmp-spell" },
        { "barreiroleo/ltex-extra.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },

        -- Other mason stuff
        { "jose-elias-alvarez/null-ls.nvim" },
        { "jayp0521/mason-null-ls.nvim" },

        -- DAP
        { "mfussenegger/nvim-dap" },
        { "jayp0521/mason-nvim-dap.nvim" },
    },
    config = function()
        require("config.lsp-zero")
    end,
}
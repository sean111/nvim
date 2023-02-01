local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-lua/plenary.nvim",
        priority = 900
    },
    {
        "stevearc/dressing.nvim",
        priority = 900
    },


    {
        "sam4llis/nvim-tundra",
        priority = 1000,
        config = function()
            require('nvim-tundra').setup({
                plugins = {
                    lsp = true,
                    treesitter = true,
                    cmp = true,
                    context = true,
                    dbui = false,
                    gitsigns = true,
                    telescope = true
                },
                syntax = {
                    booleans = { bold = true, italic = true },
                    comments = { italic = true },
                    types = { italic = true },
                    constants = { bold = true }
                }
            })
            vim.cmd('colorscheme tundra')
        end
    },

    {
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
    },

    {
        "folke/which-key.nvim",
        enter = "VimEnter",
        config = function()
            require("config.which-key").setup()
        end
    },
    {
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
    },
    
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.gitsigns")
    end,
    event = "BufReadPre",
  },

  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("config.neogit")
    end,
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
      'almo7aya/openingh.nvim',
    },
    cmd = "Octo",
    config = function()
      require("config.github")
    end
  },

  {
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
  },

  {
      "vigoux/notifier.nvim",
      config = function()
          require("config.notifier")
      end
  }
})

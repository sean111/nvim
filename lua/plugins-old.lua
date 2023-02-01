-- Auto install packer
local fn = vim.fn
local installPath = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(installPath)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        installPath })
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "RRethy/nvim-treesitter-textsubjects",
            "nvim-treesitter/nvim-treesitter-refactor",
            "nvim-treesitter/nvim-treesitter-context",
            "p00f/nvim-ts-rainbow",
        },
        run = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    }

    use {
        "folke/which-key.nvim",
        enter = "VimEnter",
        config = function()
            require("config.which-key").setup()
        end,
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "tedkulp/telescope-tele-tabby.nvim",
            "jvgrootveld/telescope-zoxide",
        },
        config = function()
            require("config.telescope")
        end,
    }

    use {
        "TimUntersberger/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = function()
            require("config.neogit")
        end,
    }

    use {
        "ojroques/nvim-bufdel",
        config = function()
            require("bufdel").setup({
                quit = false,
            })
        end
    }

    -- use({
    --     'NTBBloodbath/doom-one.nvim',
    --     setup = function()
    --         -- Add color to cursor
    --         vim.g.doom_one_cursor_coloring = true
    --         -- Set :terminal colors
    --         vim.g.doom_one_terminal_colors = true
    --         -- Enable italic comments
    --         vim.g.doom_one_italic_comments = true
    --         -- Enable TS support
    --         vim.g.doom_one_enable_treesitter = true
    --         -- Color whole diagnostic text or only underline
    --         vim.g.doom_one_diagnostics_text_color = false
    --         -- Enable transparent background
    --         vim.g.doom_one_transparent_background = false
    --
    --         -- Pumblend transparency
    --         vim.g.doom_one_pumblend_enable = false
    --         vim.g.doom_one_pumblend_transparency = 20
    --
    --         -- Plugins integration
    --         vim.g.doom_one_plugin_neorg = true
    --         vim.g.doom_one_plugin_barbar = false
    --         vim.g.doom_one_plugin_telescope = true
    --         vim.g.doom_one_plugin_neogit = true
    --         vim.g.doom_one_plugin_nvim_tree = true
    --         vim.g.doom_one_plugin_dashboard = true
    --         vim.g.doom_one_plugin_startify = true
    --         vim.g.doom_one_plugin_whichkey = true
    --         vim.g.doom_one_plugin_indent_blankline = true
    --         vim.g.doom_one_plugin_vim_illuminate = true
    --         vim.g.doom_one_plugin_lspsaga = false
    --     end,
    --     config = function()
    --         vim.cmd("colorscheme doom-one")
    --     end
    -- })
    --

    use {
        "sam4llis/nvim-tundra",
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
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { "lukas-reineke/lsp-format.nvim" },
            { "nvim-lua/lsp-status.nvim" },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- Mason
            { "jose-elias-alvarez/null-ls.nvim" },
        },
        config = function()
            require("config.lsp-zero")
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        setup = function()
            show_end_of_line = true
            filetype_exclude = { "dashboard" }
        end
    }

    use {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({
                marker_padding = true,
                -- should comment out empty or whitespace only lines
                comment_empty = true,
                -- trim empty comment whitespace
                comment_empty_trim_whitespace = true,
                -- Should key mappings be created
                create_mappings = true,
                -- Normal mode mapping left hand side
                line_mapping = "gcc",
                -- Visual/Operator mapping left hand side
                operator_mapping = "gc",
                -- text object mapping, comment chunk,,
                comment_chunk_text_object = "ic",
            })
        end
    }

    use {
        'glepnir/dashboard-nvim',
        config = function()
            require("config.dashboard")
        end
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("config.toggleterm")
    end }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("config.lualine")
        end
    }

    use 'gpanders/editorconfig.nvim'

    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.gitsigns")
        end,
        event = "BufReadPre"
    }

    use {
        "nvim-orgmode/orgmode",
        config = function()
            require("config.orgmode")
        end,
        requires = {
            "akinsho/org-bullets.nvim",
            "lukas-reineke/headlines.nvim",
        },
    }

    use {
        "nvim-neorg/neorg",
        config = function()
            require("config.neorg")
        end,
        requires = "nvim-lua/plenary.nvim"
    }

    use {
        "vigoux/notifier.nvim",
        config = function()
            require("config.notifier")
        end
    }
end)

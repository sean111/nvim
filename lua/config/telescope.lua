local utils = require("utils")

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then return end

local actions = require("telescope.actions")

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

-- Pull these into a separte config file
local dirs_to_include = { "~/projects", "~/projects/omuras/code", "~/org" }
local base_dirs = {}

-- Add our config location to the project list
if vim.env.MYVIMRC then
    table.insert(dirs_to_include, 1, utils.get_path(utils.get_path(vim.env.MYVIMRC)))
end

for _, the_dir in ipairs(dirs_to_include) do
    the_dir = string.gsub(the_dir, "~", os.getenv("HOME") or '')
    if utils.is_directory(the_dir) then
        table.insert(base_dirs, { path = the_dir })
    end
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["d"] = "delete_buffer",
                },
            },
        },
    },
    extensions = {
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            files = true,
            grouped = true,
        },
        live_grep_args = {
            auto_quoting = true,
            default_mappings = {},
        },
        project = {
            base_dirs = base_dirs,
            hidden_files = false,
        },
        tele_tabby = {
            use_highlighter = true,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                codeactions = false,
            })
        },
        zoxide = {
            config = {
                mappings = {
                    ["<C-t>"] = {
                        action = function()
                            vim.cmd("tabnew")
                        end,
                        after_action = function(selection)
                            vim.cmd("tcd " .. selection.path)
                        end,
                    },
                },
            },
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("tele_tabby")
telescope.load_extension("zoxide")
telescope.load_extension("live_grep_args")

wk.register({
    ["<leader>P"] = {
        "<cmd>Telescope project display_type=full<cr>",
        "Project List",
    },
    ["<leader>T"] = {
        function()
            local opts = require("telescope.themes").get_dropdown {
                winblend = 10,
                border = true,
                previewer = false,
                shorten_path = false,
                heigth = 20,
                width = 120
            }
            require('telescope').extensions.tele_tabby.list(opts)
        end,
        --[[ "<cmd>Telescope tele_tabby list<cr>", ]]
        "Tab List",
    },
    ["<leader>z"] = {
        function()
            require('telescope').extensions.zoxide.list()
        end,
        "Find Directory w/ 'z'",
    },
})

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

local context_ok, context = pcall(require, "treesitter-context")
if context_ok then
    context.setup()
end

local orgmode_ok, orgmode = pcall(require, "orgmode")
if orgmode_ok then
    orgmode.setup_ts_grammar()
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

local parsers_ok, parsers = pcall(require, 'nvim-treesitter.parsers')
if not parsers_ok then return end

local languages = {
    "bash",
    "comment",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "org",
    "python",
    "regex",
    "ruby",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "yaml",
    "php",
    "hcl"
}

configs.setup({
    auto_install = true,
    sync_install = true,
    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    },
    ensure_installed = languages,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    sync_install = true,
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
        },
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = { query = "@function.outer", desc = "Select function outer" },
                ["if"] = { query = "@function.inner", desc = "Select function inner" },
                ["ac"] = { query = "@class.outer", desc = "Select class outer" },
                ["ic"] = { query = "@class.inner", desc = "Select class inner" },
            },
        },
        swap = {
            enable = true,
        },
    },
})

if orgmode_ok then
    orgmode.setup()
end

local parser_config = parsers.get_parser_configs()

parser_config.tape = {
    install_info = {
        url = "https://github.com/charmbracelet/tree-sitter-vhs",
        branch = "main",
        files = { "src/parser.c" }
    },
    filetype = "tape",
}

local keymap = vim.keymap.set

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then print("which-key not loaded") return end

vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Thankfully Ted already had to deal with this crap
-- vim.api.nvim_create_augroup("_terminal", { clear = true })
-- vim.api.nvim_create_autocmd("TermOpen", {
--     group = "_terminal",
--     pattern = "term://*",
--     callback = function()
--         local _opts = { noremap = true, silent = true }
--         keymap("t", "<Esc>", "<c-\\><c-n>", _opts)
--     end,
-- })

whichkey.setup({
    show_help = false,
    ignore_missing = false,
    plugins = {
      marks = true,
      registers = true,
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = falsewhich,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = "single",
      position = "bottom",
      margin = { 0, 0, 0, 0, },
      padding = { 0, 1, 0, 1, },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 1, max = 50 },
      spacing = 10,
      align = "center",
    },
})

whichkey.register({
    ["<leader><leader>"] = { "<cmd>Telescope find_files<CR>", "Find Files" },
    ["<leader>,"] = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
    ["<leader>/"] = { "<cmd>Telescope live_grep_args<CR>", "File Search" },
    ["<leader>."] = { "<cmd>Telescope find_files<CR>", "Find Files" },
    ["<leader>l"] = {
        name = "+LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
        A = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        f = { "<cmd>LspZeroFormat<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { vim.diagnostic.goto_next, "Next Diagnostic", },
        k = { vim.diagnostic.goto_prev, "Prev Diagnostic", },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        w = { "<cmd>Telescope diagnostics theme=get_ivy<cr>", "Workspace Diagnostics" },
        R = { "<cmd>LspRestart<cr>", "Restart LSP" },
    },
    ["<leader>L"] = {
        name = "+Lazy (Plugin Manager)",
        l = { "<cmd>Lazy show<cr>", "Show Interface" },
        s = { "<cmd>Lazy sync<cr>", "Sync Plugins" },
        p = { "<cmd>Lazy profile<cr>", "Startup Profile" },
    },
    ["<leader>b"] = {
        name = "+Buffer/Splits",
        c = { "<cmd>close<cr>", "Close split" },
        f = { "<cmd>Telescope buffers<cr>", "Find" },
        s = { "<cmd>split<cr>", "Split Horizontal" },
        v = { "<cmd>vsplit<cr>", "Split Vertical" },
        n = { "<cmd>bnext<cr>", "Next Buffer" },
        p = { "<cmd>bprevious<br>", "Previous Buffer" },
    },
    ["<leader>c"] = { "<cmd>BufDel<CR>", "Close Buffer" },
    ["<leader>C"] = { "<cmd>BufDel!<CR>", "Close Buffer (force)" },
    ["<leader>g"] = {
        name = "+Git",
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
    },
    ["<leader>s"] = {
        name = "+Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    ["<leader>o"] = {
        name = "Open",
        t = { "<cmd>ToggleTerm<cr>", "Toggle terminal" }
    },
    ["g"] = {
        a = { "<cmd>TSTextobjectSwapNext @parameter.inner<cr>", "Swap Arg Right" },
        A = { "<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>", "Swap Arg Left" },
    },
    ["["] = {
        f = { "<cmd>TSTextobjectGotoPreviousStart @function.outer<cr>", "Previous Function Start" },
        c = { "<cmd>TSTextobjectGotoPreviousStart @class.outer<cr>", "Previous Class Start" },
        b = { "<cmd>TSTextobjectGotoPreviousStart @block.inner<cr>", "Previous Block Start" },
        F = { "<cmd>TSTextobjectGotoPreviousEnd @function.outer<cr>", "Previous Function End" },
        C = { "<cmd>TSTextobjectGotoPreviousEnd @class.outer<cr>", "Previous Class End" },
        B = { "<cmd>TSTextobjectGotoPreviousEnd @block.inner<cr>", "Previous Block End" },
    },
    ["]"] = {
        f = { "<cmd>TSTextobjectGotoNextStart @function.outer<cr>", "Next Function Start" },
        c = { "<cmd>TSTextobjectGotoNextStart @class.outer<cr>", "Next Class Start" },
        b = { "<cmd>TSTextobjectGotoNextStart @block.inner<cr>", "Next Block Start" },
        F = { "<cmd>TSTextobjectGotoNextEnd @function.outer<cr>", "Next Function End" },
        C = { "<cmd>TSTextobjectGotoNextEnd @class.outer<cr>", "Next Class End" },
        B = { "<cmd>TSTextobjectGotoNextEnd @block.inner<cr>", "Next Block End" },
    },
})


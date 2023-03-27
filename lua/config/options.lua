local keymap = vim.keymap.set

local options = {
    background = "dark",
    expandtab = true,
    termguicolors = true,
    number = true,
    tabstop = 4,
    softtabstop = 4,
    smartindent = true,
    wrap = false,
    clipboard = "unnamedplus",
    cursorline = true,
    shiftwidth = 4,
}

for key, val in pairs(options) do
    vim.opt[key] = val
end

vim.opt.guifont = { "Cascadia Code iCursive Dk", "h12" }

vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- -- Thankfully Ted already had to deal with this crap
vim.api.nvim_create_augroup("_terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = "_terminal",
    pattern = "term://*",
    callback = function()
        local _opts = { noremap = true, silent = true }
        keymap("t", "<Esc>", "<c-\\><c-n>", _opts)
    end,
})
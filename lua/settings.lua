local api = vim.api

vim.opt.guifont = { "Cascadia Code iCursive Dk", "h12" }
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"

vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.number = true


-- autocmd BufEnter * silent! lcd %:p:h
-- api.nvim_create_autocmd("BufEnter", {
--     command = "silent! lcd %:p:h",
-- })

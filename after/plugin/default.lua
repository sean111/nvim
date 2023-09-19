vim.cmd [[highlight Headline1 guibg=#1e2718]]
vim.cmd [[highlight Headline2 guibg=#21262d]]
vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
})

local fine_ok, fine = pcall(require, "fine-cmdline")
if fine_ok then
    vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
end

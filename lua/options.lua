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

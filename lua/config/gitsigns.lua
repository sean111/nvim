local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then return end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

gitsigns.setup()

wk.register({
    ["<leader>g"] = {
        l = { gitsigns.blame_line { full = true }, "Blame" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
    }
})

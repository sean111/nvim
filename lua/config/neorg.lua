local status_ok, neorg = pcall(require, "neorg")
if not status_ok then print("norg not loaded") return end

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then return end

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/notes/work",
                    personal = "~/Documents/notes/personal"
                }
            }
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        }
    }
}


local config = cmp.get_config()
table.insert(config.sources, {
    name = "neorg"
})
cmp.setup(config)

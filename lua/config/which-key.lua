local M = {}

function M.setup()
  local module_name = "which-key"
  local whichkey = require(module_name)

  local conf = {
    show_help = false,
    ignore_missing = false,
    plugins = {
      marks = true,
      registers = true,
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = false,
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
  }

  whichkey.setup(conf)
end

return M


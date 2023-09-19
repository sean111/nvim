return {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({})
        end,
      },
      "VonHeikemen/lsp-zero.nvim",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
    enabled = false,
  }

-- if true then return {} end

--- @type LazySpec
return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {
    adapters = {
      acp = {
        codex = function()
          return require("codecompanion.adapters").extend("codex", {
            defaults = {
              ---@param self CodeCompanion.ACPAdapter
              ---@return string
              model = function(self) return "gpt-5.3-codex" end,
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = "codex",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

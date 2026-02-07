-- if true then return {} end

--- @type LazySpec
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = { "InsertEnter", "BufReadPost", "BufNewFile" },
  opts = {
    suggestion = {
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- implement the ai_accept function
            ai_accept = function()
              local ok, suggestion = pcall(require, "copilot.suggestion")
              if ok and suggestion.is_visible() then
                suggestion.accept()
                return true
              end
            end,
          },
        },
      },
    },
  },
}

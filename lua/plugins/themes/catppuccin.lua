-- if true then return {} end

---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  opts = {
    transparent_background = true,
    integrations = {
      native_lsp = {
        enabled = true,
      },
    },
    --   custom_highlights = function()
    --     return {
    --       Normal = { bg = "NONE" },
    --       NormalNC = { bg = "NONE" },
    --       NormalFloat = { bg = "NONE" },
    --       FloatBorder = { bg = "NONE" },
    --       SignColumn = { bg = "NONE" },
    --       EndOfBuffer = { bg = "NONE" },
    --       StatusLine = { bg = "NONE" },
    --       StatusLineNC = { bg = "NONE" },
    --     }
    --   end,
  },
}

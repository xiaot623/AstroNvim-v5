-- if true then return {} end

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- 更改配色方案
    colorscheme = "astrodark",
    highlights = {
      init = {
        -- Normal = { bg = "#000000" },
      },
      astrodark = {
        -- Normal = { bg = "#000000" },
      },
    },
    -- 配置图标
    icons = {
      -- Loading
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}

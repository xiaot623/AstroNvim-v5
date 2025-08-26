require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^5", -- 取消版本追踪以选择夜间版 AstroNvim
    import = "astronvim.plugins",
    opts = { -- 必须在此处使用 `import` 键设置 AstroNvim 选项
      mapleader = " ", -- 确保在 Lazy 设置之前配置 leader 键
      maplocalleader = ",", -- 确保在 Lazy 设置之前配置 localleader 键
      icons_enabled = true, -- 如果没有 Nerd Font，可将此项设为 false 以禁用图标
      pin_plugins = nil, -- 默认会在跟踪 AstroNvim 的 `version` 时固定插件，设置为 true/false 可覆盖
      update_notifications = true, -- 启用/禁用关于运行 `:Lazy update` 的通知
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- 在此配置其他 `lazy.nvim` 的选项
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- 禁用一些 rtp 插件，按需添加更多
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])

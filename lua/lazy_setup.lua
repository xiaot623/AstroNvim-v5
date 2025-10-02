require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^5", -- 版本号
    import = "astronvim.plugins",
    opts = {
      mapleader = " ", -- leader
      maplocalleader = ",", -- localleader
      icons_enabled = true, -- 启用图标
      pin_plugins = true, -- 固定插件
      update_notifications = true, -- `:Lazy update` 的通知
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
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

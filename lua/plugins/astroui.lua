-- if true then return {} end -- 警告：移除此行以激活此文件

-- AstroUI 提供配置 AstroNvim 用户界面的基础
-- 配置文档可通过 `:h astroui` 查看
-- 注意：强烈推荐安装 Lua 语言服务器（`LspInstall lua_ls`）
--       这样在编辑时会提供自动补全和文档提示

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- 更改配色方案
    colorscheme = "astrodark",
    -- AstroUI 允许你轻松修改任意配色方案的高亮组
    highlights = {
      init = { -- 该表会覆盖所有主题中的高亮配置
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- 应用 astrotheme 主题时的覆盖/更改表
        -- Normal = { bg = "#000000" },
      },
    },
    -- 可在整个界面中配置图标
    icons = {
      -- 配置在状态栏中加载 LSP 的图标
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

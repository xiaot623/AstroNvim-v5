if true then return {} end -- 警告：移除此行以激活此文件

-- 自定义 Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- 覆盖 `require("mason-tool-installer").setup(...)` 的默认配置
    opts = {
      -- 请确保使用 `:Mason` 中显示的包名
      ensure_installed = {
        -- 安装语言服务器
        "lua-language-server",
 
        -- 安装格式化工具
        "stylua",
 
        -- 安装调试器
        "debugpy",
 
        -- 安装其他工具
        "tree-sitter-cli",
      },
    },
  },
}

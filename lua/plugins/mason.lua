if true then return {} end

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
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

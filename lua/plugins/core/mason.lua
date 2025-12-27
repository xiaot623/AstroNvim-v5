if true then return {} end

--[[
About mason:
一个适用于 Neovim 的便携式包管理器，可以在 Neovim 运行的任何地方运行。
轻松安装和管理 LSP 服务器、DAP 服务器、代码检查器和格式化工具。
--]]

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- 安装语言服务器

        -- 安装格式化工具

        -- 安装调试器

        -- 安装其他工具
      },
    },
  },
}

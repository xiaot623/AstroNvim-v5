if true then return {} end -- 警告：移除此行以激活此文件

-- 自定义 Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- 可在此添加更多解析器（parsers）
    },
  },
}

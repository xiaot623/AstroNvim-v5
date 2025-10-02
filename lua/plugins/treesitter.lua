if true then return {} end -- 警告：移除此行以激活此文件

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
    },
  },
}

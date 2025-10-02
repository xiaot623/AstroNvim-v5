-- if true then return {} end

-- 添加 AstroCommunity 开箱即用的模块
-- ⚠️：会先于 plugins/ 文件夹加载，即可以在 plugins 中对文件进行覆盖

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- 语言支持
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  -- Git 支持
  { import = "astrocommunity.git.git-blame-nvim" },
}

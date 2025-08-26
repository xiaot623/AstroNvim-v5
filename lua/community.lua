-- if true then return {} end -- 警告：移除此行以激活此文件

-- AstroCommunity：在此导入社区模块
-- 我们在 `lazy_setup.lua` 中导入此文件，位于 `plugins/` 文件夹之前。
-- 这样可以保证在任何用户插件之前处理这些规格（specs）。

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- 语言支持
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  -- Git 支持
  { import = "astrocommunity.git.git-blame-nvim" },
}

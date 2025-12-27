-- if true then return {} end

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },
  -- Git 支持
  { import = "astrocommunity.git.git-blame-nvim" },
}

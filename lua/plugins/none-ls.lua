if true then return {} end -- 警告：移除此行以激活此文件

-- 自定义 None-ls 源

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts 变量是 setup 函数调用的默认配置表
    -- local null_ls = require "null-ls"

    -- 检查支持的格式化器与 linter
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- 仅插入新的源，不要替换现有的源
    -- （如果希望替换，请使用 `opts.sources = {}` 而不是 `list_insert_unique` 函数）
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- 设置格式化器
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    })
  end,
}

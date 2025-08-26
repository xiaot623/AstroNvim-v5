if true then return {} end -- 警告：移除此行以激活此文件

-- AstroCore 提供一个集中位置用于修改映射、vim 选项、自动命令等
-- 配置文档可通过 `:h astrocore` 查看
-- 注意：强烈建议安装 Lua 语言服务器（`LspInstall lua_ls`）
--       这样在编辑时会提供补全和文档

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- 配置 AstroNvim 的核心功能
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- 为大文件设置全局限制，以便在诸如 treesitter 等功能中禁用某些特性
      autopairs = true, -- 启用自动配对（autopairs）
      cmp = true, -- 启用补全（cmp）
      diagnostics = { virtual_text = true, virtual_lines = false }, -- 启动时的诊断设置
      highlighturl = true, -- 启动时高亮 URL
      notifications = true, -- 启用通知
    },
    -- 当诊断启用时的诊断配置（用于 vim.diagnostics.config({...}））
        diagnostics = {
          virtual_text = true,
          underline = true,
        },
    -- 传递给 `vim.filetype.add`
        filetypes = {
          -- 用法见 `:h vim.filetype.add`
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- 可在此配置 vim 选项
        options = {
          opt = { -- 对应 vim.opt.<key>
            relativenumber = true, -- 设置 vim.opt.relativenumber
            number = true, -- 设置 vim.opt.number
            spell = false, -- 设置 vim.opt.spell
            signcolumn = "yes", -- 设置 vim.opt.signcolumn 为 "yes"
            wrap = false, -- 设置 vim.opt.wrap
          },
      g = { -- 对应 vim.g.<key>
        -- 配置全局 vim 变量（vim.g）
        -- 注意：`mapleader` 和 `maplocalleader` 必须在 AstroNvim 的 opts 中或在 `lazy.setup` 之前设置
        -- 相关设置位于 `lua/lazy_setup.lua` 文件中
      },
    },
    -- 也可以通过 AstroCore 配置映射（mappings）
    -- 注意：按键代码遵循 vim 文档中的大小写，例如 `<Leader>` 必须大写
        mappings = {
      -- 第一个键表示模式（mode）
      n = {
        -- 第二个键表示映射的左侧按键

        -- 在缓冲区标签之间导航
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
 
        -- 在组名为 "Buffer" 下可见的映射
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- 仅包含 `desc` 键的表将在 which-key（若已安装）中注册
        -- 这对于命名菜单很有用
        -- ["<Leader>b"] = { desc = "Buffers" },
 
        -- 将映射设置为 false 会禁用该映射
        -- ["<C-S>"] = false,
      },
    },
  },
}

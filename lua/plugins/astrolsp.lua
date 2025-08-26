-- if true then return {} end -- 警告：移除此行以激活此文件

-- AstroLSP 允许你自定义 AstroNvim 的 LSP 配置引擎中的功能
-- 配置文档可通过 `:h astrolsp` 查阅
-- 注意：强烈推荐安装 Lua 语言服务器（`LspInstall lua_ls`）
--       这样在编辑时可以获得自动补全和文档提示

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- AstroLSP 提供的功能配置表
        features = {
          codelens = true, -- 启用/禁用启动时的 codelens 刷新
          inlay_hints = false, -- 启用/禁用启动时的 inlay hints
          semantic_tokens = true, -- 启用/禁用语义标记高亮
        },
    -- 自定义 LSP 的格式化选项
        formatting = {
          -- 控制保存时的自动格式化
          format_on_save = {
            enabled = true, -- 全局启用或禁用保存时格式化
            allow_filetypes = { -- 仅对指定文件类型启用保存时格式化
              -- "go",
            },
            ignore_filetypes = { -- 对指定文件类型禁用保存时格式化
              -- "python",
            },
          },
          disabled = { -- 禁用列出语言服务器的格式化能力
            -- 若想使用 StyLua 格式化 Lua 代码，可禁用 lua_ls 的格式化能力
            -- "lua_ls",
          },
          timeout_ms = 1000, -- 默认格式化超时时间
          -- filter = function(client) -- 完全覆盖默认格式化函数
          --   return true
          -- end
        },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- 自定义语言服务器的附加方式（attach）
        handlers = {
          -- 没有键的函数将作为默认处理器，该函数接受两个参数：服务器名和为该服务器配置的选项表
          -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- 下面的键是正在通过 `lspconfig` 设置的服务器名称
      -- rust_analyzer = false, -- 将处理器设为 false 会禁用对应语言服务器的设置
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- 或者传入自定义处理函数
    },
    -- 配置附加语言服务器时要添加的缓冲区局部自动命令
        autocmds = {
          -- 第一个键是要将自动命令添加到的 `augroup` (:h augroup)
          lsp_codelens_refresh = {
            -- 可选条件用于创建/删除自动命令组
            -- 可以是客户端能力的字符串，也可以是 `fun(client, bufnr): boolean` 的函数
            -- 条件将在每次执行时为每个客户端解析，如果对所有客户端都不满足，
            -- 则该缓冲区的自动命令将被删除
            cond = "textDocument/codeLens",
            -- cond = function(client, bufnr) return client.name == "lua_ls" end,
            -- 要设置的自动命令列表
            {
              -- 触发事件
              event = { "InsertLeave", "BufEnter" },
              -- 其余的 autocmd 选项 (:h nvim_create_autocmd)
              desc = "Refresh codelens (buffer)",
              callback = function(args)
                if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
              end,
            },
          },
        },
    -- 在附加语言服务器时要设置的映射
        mappings = {
          n = {
            -- `cond` 键可以是要求附加时存在的服务器能力的字符串，或是一个接收 `client` 和 `bufnr` 参数并返回布尔值的函数（来自 `on_attach`）
            gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    -- 自定义的 `on_attach` 函数，会在默认的 `on_attach` 函数之后运行
    -- 接受两个参数：`client` 和 `bufnr`（参见 `:h lspconfig-setup`）
        on_attach = function(client, bufnr)
          -- 这将禁用所有客户端的 semanticTokensProvider
          -- client.server_capabilities.semanticTokensProvider = nil
        end,
  },
}

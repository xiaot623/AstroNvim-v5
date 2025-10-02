if true then return {} end

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true, -- 启动时的 codelens 刷新
      inlay_hints = false, -- 启动时的 inlay hints
      semantic_tokens = true, -- 语义标记高亮
    },
    -- 格式化选项
    formatting = {
      format_on_save = { -- 自动格式化配置
        enabled = true,
        allow_filetypes = {
          -- "go"
        },
        ignore_filetypes = {
          -- "python",
        },
      },
      disabled = {
        -- "lua_ls",
      },
      timeout_ms = 1000, -- 超时时间
      -- 完全覆盖默认格式化函数
      -- filter = function(client)
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {},
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- 没有键的函数将作为默认处理器
    -- Param: 服务器名, 为该服务器配置的选项表
    handlers = {},
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

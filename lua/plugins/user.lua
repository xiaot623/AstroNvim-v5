if true then return {} end

-- 示例文件：在 /plugins 目录下有相同效果

---@type LazySpec
return {

  -- 添加插件的示例

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- 覆盖插件的示例
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- 禁用默认插件示例：
  { "max397574/better-escape.nvim", enabled = false },

  -- 自定义默认插件配置
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- 引入默认的 AstroNvim 配置，该配置会调用插件的 setup
      -- 添加更多自定义的 luasnip 配置，例如扩展文件类型或自定义片段
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- 引入默认的 AstroNvim 配置，该配置会调用插件的 setup
      -- 添加更多自定义的 autopairs 配置，例如自定义规则
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- 如果下一个字符是 % 则不要添加配对
            :with_pair(cond.not_after_regex "%%")
            -- 如果前一个字符是 xxx 则不要添加配对
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- 重复字符时不要向右移动
            :with_move(cond.none())
            -- 如果下一个字符是 xx 则不要删除
            :with_del(cond.not_after_regex "xx")
            -- 按下 <cr> 时禁用添加新行
            :with_cr(cond.none()),
        },
        -- 在 .vim 文件中禁用，但可在其他文件类型中生效
        Rule("a", "a", "-vim")
      )
    end,
  },
}

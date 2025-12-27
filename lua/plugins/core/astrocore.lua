-- if true then return {} end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true, -- 启用补全
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
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
    options = { -- vim options
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = true,
        shiftwidth = 4,
        tabstop = 4,
        expandtab = true,
        smarttab = true,
        softtabstop = 4,
        clipboard = "unnamedplus",
      },
      g = { -- vim.g.<key>
        clipboard = {
          name = "OSC 52",
          copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy "+",
            ["*"] = require("vim.ui.clipboard.osc52").copy "*",
          },
          paste = {
            ["+"] = require("vim.ui.clipboard.osc52").paste "+",
            ["*"] = require("vim.ui.clipboard.osc52").paste "*",
          },
        },
      },
    },
    mappings = { -- AstroNvim 快捷键映射
      n = {
        ["]b"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer",
        },

        ["[b"] = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer",
        },

        ["<M-Left>"] = { "<C-o>", desc = "Jump back" },
        ["<M-Right>"] = { "<C-i>", desc = "Jump forward" },
      },
    },
  },
}

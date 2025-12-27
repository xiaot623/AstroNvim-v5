-- if true then return {} end

---@type LazySpec
return {
  "Pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    enabled = true,
    execution_message = {
      message = function() return "" end,
    },
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
    },
    condition = function(buf)
      local fn = vim.fn
      local utils = require "auto-save.utils.data"

      if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then return true end
      return false
    end,
    write_all_buffers = false,
    debounce_delay = 200,
  },
}

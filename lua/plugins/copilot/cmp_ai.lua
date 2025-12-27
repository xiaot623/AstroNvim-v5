-- if true then return {} end

--- @type LazySpec
return {
  "Saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    -- define the ai_accept func and bind to the <Tab> keymap
    if not opts.keymap then opts.keymap = {} end
    opts.keymap["<Tab>"] = {
      "snippet_forward",
      function()
        if vim.g.ai_accept then return vim.g.ai_accept() end
      end,
      "fallback",
    }
    opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }
  end,
}

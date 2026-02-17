-- if true then return {} end

--- @type LazySpec
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatToggle" },
    keys = {
      { "<leader>aa", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Chat", mode = { "n", "v" } },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then require("CopilotChat").ask(input) end
        end,
        desc = "Quick Chat",
        mode = { "n", "v" },
      },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain", mode = { "n", "v" } },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review", mode = { "n", "v" } },
      { "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix", mode = { "n", "v" } },
      { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize", mode = { "n", "v" } },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "Docs", mode = { "n", "v" } },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Tests", mode = { "n", "v" } },
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "Reset Chat" },
    },
    opts = {
      model = "gpt-5.3-codex",
    },
  },
}

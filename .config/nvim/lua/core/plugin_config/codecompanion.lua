local llm = require("codecompanion")

llm.setup({
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        schema = {
          model = {
            --default = "qwen2.5:0.5b",
            default = "deepseek-coder",
          },
        },
        env = {
          url = "http://10.0.10.218:11434",
          -- api_key = "OLLAMA_API_KEY",
        },
        headers = {
          ["Content-Type"] = "application/json",
          -- ["Authorization"] = "Bearer ${api_key}",
        },
        parameters = {
          sync = true,
        },
      })
    end,
  },
 strategies = {
        chat = {
            adapter="ollama",
        },
    inline = {
            adapter="ollama",
      keymaps = {
        accept_change = {
          modes = { n = "ga" },
          description = "Accept the suggested change",
        },
        reject_change = {
          modes = { n = "gr" },
          description = "Reject the suggested change",
        },
      },
    },
  },
})

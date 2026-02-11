vim.g.opencode_opts = {
	provider = {
		enabled = "tmux",
		-- tmux = {
		-- 	pane = "1",
		-- },
	},
	on_opencode_not_found = function() end,
	on_submit = function() end,
}

vim.opt.autoread = true

local opencode = require("opencode")

vim.keymap.set({ "n", "x" }, "<leader>oa", function()
	opencode.ask("@this: ", { submit = true })
end, { desc = "Ask about this" })

vim.keymap.set({ "n", "x" }, "<leader>os", function()
	opencode.select()
end, { desc = "Select prompt" })

vim.keymap.set({ "n", "x" }, "<leader>o+", function()
	opencode.prompt("@this")
end, { desc = "Add this" })

vim.keymap.set("n", "<leader>ot", function()
	opencode.toggle()
end, { desc = "Toggle embedded" })

vim.keymap.set("n", "<leader>oc", function()
	opencode.command()
end, { desc = "Select command" })

vim.keymap.set("n", "<leader>on", function()
	opencode.command("session_new")
end, { desc = "New session" })

vim.keymap.set("n", "<leader>oi", function()
	opencode.command("session_interrupt")
end, { desc = "Interrupt session" })

vim.keymap.set("n", "<leader>oA", function()
	opencode.command("agent_cycle")
end, { desc = "Cycle selected agent" })

vim.keymap.set("n", "<S-C-u>", function()
	opencode.command("messages_half_page_up")
end, { desc = "Messages half page up" })

vim.keymap.set("n", "<S-C-d>", function()
	opencode.command("messages_half_page_down")
end, { desc = "Messages half page down" })

vim.keymap.set("n", "<leader>oq", function()
	opencode.ask("", { submit = true })
end)

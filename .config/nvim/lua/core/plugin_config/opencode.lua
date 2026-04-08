-- Set tmux environment variable with neovim's CWD so opencode starts in the right directory
vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		vim.fn.system(string.format("tmux set-environment TMUX_NVIM_CWD '%s'", vim.fn.getcwd()))
	end,
})
-- Set initial CWD
vim.fn.system(string.format("tmux set-environment TMUX_NVIM_CWD '%s'", vim.fn.getcwd()))

vim.g.opencode_opts = {
	provider = {
		enabled = "tmux",
		cmd = "direnv exec . opencode --port",
		-- tmux_target = nil, --"Opencode",
		-- tmux = {
		-- 	target = "Opencode",
		-- 	-- pane_id = "1",
		-- },
	},
	-- server = {
	-- 	enabled = true,
	-- 	port = 8080,
	-- },
	on_opencode_not_found = function()
		-- -- Opción A (segura): solo avisar, NO crear nada mágico
		-- vim.notify(
		-- 	"No se encontró ninguna sesión de opencode para este proyecto.\n"
		-- 		.. "Abrí una con: `opencode --port 8080` en tmux o usa <leader>ot para embebido.",
		-- 	vim.log.levels.WARN
		-- )

		-- Opción B (más automática): descomenta esto si querés que cree embebido
		-- require("opencode").toggle()
	end,
	on_submit = function() end,
	project_root = function()
		return vim.fn.getcwd()
	end,
}

vim.opt.autoread = true

local opencode = require("opencode")

vim.keymap.set({ "n", "x" }, "<leader>oa", function()
	-- local ok = pcall(function()
	-- 	opencode.prompt("@this: ", { submit = true })
	-- end)
	-- if not ok then
	-- 	vim.notify("No hay opencode en este tmux pane. Split + opencode tui", vim.log.levels.ERROR)
	-- end
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

-- local ot_config = require("opencode-tmux.config")

-- ot_config.setup({ auto_close = true, find_sibling = true })

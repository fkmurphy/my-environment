require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"eslint_d",
		-- otros: "prettierd", "stylua", etc
	},
	auto_update = false,
	run_on_start = true,
})

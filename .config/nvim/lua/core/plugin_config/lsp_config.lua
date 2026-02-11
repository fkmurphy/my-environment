local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Instalación automática con Mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"eslint",
		"html",
		"lua_ls",
		"cssls",
		"astro",
		"solidity",
		"pyright",
		"tflint",
	},
	-- Esta parte handlers cambia completamente
	handlers = {
		function(server_name)
			-- La magia: vim.lsp.config en lugar de lspconfig[server].setup
			vim.lsp.config(server_name, {
				capabilities = capabilities,
			})
			vim.lsp.enable(server_name)
		end,
		-- Handlers específicos siguen parecidos pero con sintaxis nueva
		["eslint"] = function()
			vim.lsp.config("eslint", {
				capabilities = capabilities,
				settings = {
					format = { enable = true },
					codeActionsOnSave = {
						mode = "all",
						rules = { "!debugger", "!no-only-tests/*" },
					},
				},
			})
			vim.lsp.enable("eslint")
		end,
		["ts_ls"] = function()
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayFunctionParameterTypeHints = false,
							includeInlayFunctionLikeReturnTypeHints = true,
						},
					},
				},
			})
			vim.lsp.enable("ts_ls")
		end,
		["lua_ls"] = function()
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.stdpath("config") .. "/lua",
							},
						},
						telemetry = { enable = false },
					},
				},
			})
			vim.lsp.enable("lua_ls")
		end,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true, noremap = true }
		local map = function(mode, lhs, rhs, desc)
			opts.desc = desc
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Lo que antes era Lspsaga:

		-- <Leader>gd: goto_definition (COMENTADO - colisiona con Telescope)
		-- map("n", "<Leader>gd", vim.lsp.buf.definition, "Goto Definition")
		-- Usar Telescope: <leader>gd (builtin.lsp_definitions)

		-- <Leader>pd: "peek definition" – no existe nativo; alternativa simple:
		map("n", "<Leader>pd", function()
			vim.cmd("vsplit")
			vim.lsp.buf.definition()
		end, "Peek Definition (vsplit)")

		-- NOTA: Estos se manejan desde Telescope:
		-- <Leader>gr: builtin.lsp_references
		-- gr: builtin.lsp_references
		-- <Leader>lo: builtin.treesitter
		-- <Leader>gd: builtin.lsp_definitions
		-- <Leader>ws: builtin.lsp_workspace_symbols
		-- <Leader>gI: builtin.lsp_implementations
		-- <Leader>gt: builtin.lsp_type_definitions

		-- K: hover_doc
		map("n", "K", vim.lsp.buf.hover, "Hover")

		-- <leader>ca: code_action
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")

		-- <leader>rn: rename
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")

		-- <Leader>e: diagnostics floating
		map("n", "<Leader>e", vim.diagnostic.open_float, "Line diagnostics")

		-- <Leader>ge / <Leader>gp: next/prev diagnostic
		map("n", "<Leader>ge", vim.diagnostic.goto_next, "Next diagnostic")
		map("n", "<Leader>gp", vim.diagnostic.goto_prev, "Prev diagnostic")

		-- <Leader>ke: setloclist con todos los diagnostics
		map("n", "<Leader>ke", vim.diagnostic.setloclist, "Diagnostics loclist")
	end,
})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = true,
	severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

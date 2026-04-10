local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")

-- Instalación automática con Mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",

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
			vim.lsp.config(server_name, {
				capabilities = capabilities,
			})
			vim.lsp.enable(server_name)
		end,
		["eslint"] = function()
			vim.lsp.config("eslint", {
				capabilities = capabilities,
				root_dir = util.root_pattern(
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.json",
					"eslint.config.js",
					"eslint.config.mjs",
					"eslint.config.cjs",
					"package.json"
				),
				settings = {
					format = { enable = false },
					workingDirectory = { mode = "auto" },
				},
			})
			vim.lsp.enable("eslint")
		end,
		["ts_ls"] = function()
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				flags = {
					debounce_text_changes = 150,
				},
				root_dir = function(fname)
					return util.root_pattern("tsconfig.json", "package.json", ".git")(fname)
				end,
				init_options = {
					preferences = {
						includeCompletionsForModuleExports = true,
					},
				},
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayFunctionParameterTypeHints = false,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayVariableTypeHints = false,
						},
						maxTsServerMemory = 8192,
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayFunctionParameterTypeHints = false,
							includeInlayVariableTypeHints = false,
						},
						maxTsServerMemory = 8192,
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

		-- <Leader>gd: Usando Telescope (ver telescope.lua)
		-- Permite elegir entre múltiples definiciones e ir a node_modules

		-- <Leader>pd: "peek definition" – no existe nativo; alternativa simple:
		map("n", "<Leader>pd", function()
			vim.cmd("vsplit")
			vim.lsp.buf.definition()
		end, "Peek Definition (vsplit)")

		-- NOTA: Estos se manejan desde Telescope:
		-- <Leader>gr: builtin.lsp_references
		-- gr: builtin.lsp_references
		-- <Leader>lo: builtin.treesitter
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
	update_in_insert = true,
	virtual_text = true,
	severity_sort = true,
	signs = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-vitest")({
			filter_dir = function(name, rel_path, root)
				return name ~= "node_modules"
			end,
		}),
	},
	status = { virtual_text = true },
	output = { open_on_run = true },
	quickfix = {
		open = function()
			vim.cmd("Trouble quickfix")
		end,
	},
})

vim.keymap.set("n", "<leader>tt", function()
	neotest.run.run()
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tT", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run file tests" })

vim.keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })

vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Toggle test summary" })

vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true })
end, { desc = "Show test output" })

vim.keymap.set("n", "<leader>tO", function()
	neotest.output_panel.toggle()
end, { desc = "Toggle output panel" })

vim.keymap.set("n", "<leader>tS", function()
	neotest.run.stop()
end, { desc = "Stop tests" })

vim.keymap.set("n", "<leader>tw", function()
	neotest.watch.toggle(vim.fn.expand("%"))
end, { desc = "Toggle watch mode" })

vim.keymap.set("n", "]t", function()
	neotest.jump.next({ status = "failed" })
end, { desc = "Next failed test" })

vim.keymap.set("n", "[t", function()
	neotest.jump.prev({ status = "failed" })
end, { desc = "Previous failed test" })
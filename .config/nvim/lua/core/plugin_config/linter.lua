local lint = require("lint")

lint.linters_by_ft = {
	nunjucks = { "djlint" },
	bash = { "shellcheck" },
	shell = { "shellcheck" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("lint", { clear = true }),
	callback = function()
		if vim.bo.modifiable then
			lint.try_lint()
		end
	end,
})
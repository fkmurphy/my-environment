local lint = require("lint")

lint.linters_by_ft = {
    nunjucks = { 'djlint' },
    bash = {'shellcheck'},
    shell = {'shellcheck'}
}

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- vim.diagnostic.config({ virtual_text = true }, customlint)

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })
-- local lint_progress = function()
--   local linters = lint.get_running()
--   if #linters == 0 then
--       return "󰦕"
--   end
--   return "󱉶 " .. table.concat(linters, ", ")
-- end

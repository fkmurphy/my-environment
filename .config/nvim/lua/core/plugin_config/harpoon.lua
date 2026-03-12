local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>haa", function()
	harpoon:list():add()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<leader>hah", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

vim.keymap.set("n", "<leader>ha1", function()
	harpoon:list():select(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<leader>ha2", function()
	harpoon:list():select(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<leader>ha3", function()
	harpoon:list():select(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<leader>ha4", function()
	harpoon:list():select(4)
end, { desc = "Harpoon file 4" })
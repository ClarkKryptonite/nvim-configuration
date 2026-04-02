-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
	diagnostics = {
		enable = true,
	},
	view = {
		width = {},
	},
	renderer = {
		group_empty = true,
	},
})

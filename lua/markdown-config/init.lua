local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local cmd = vim.api.nvim_create_autocmd

map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", opts)

cmd("FileType", {
	pattern = "markdown",
	group = vim.api.nvim_create_augroup("MarkdownSnippet", { clear = true }),
	callback = function()
		-- enbale table snippet
		vim.api.nvim_exec("TableModeEnable", true)
		-- normal mode keymap
		map("n", "<leader>tc", "<cmd>GenTocMarked<CR>", opts)
		-- insert mode keymap
		-- function
		map("i", ",o", "<cmd>MarkdownPreview<CR>", opts)
		map("i", ",O", "<cmd>MarkdownPreviewStop<CR>", opts)
		map("i", ",P", "<cmd>call mdip#MarkdownClipboardImage()<CR>", opts)
		-- snippet
		map("i", ",f", "<Esc>/<++><CR>:nohlsearch<CR>c4l", opts)
		map("i", ",n", "---<Enter><Enter>", opts)
		map("i", ",b", "**** <++><ESC>6hi", opts)
		map("i", ",s", "~~~~ <++><ESC>6hi", opts)
		map("i", ",i", "** <++><ESC>5hi", opts)
		map("i", ",d", "`` <++><ESC>5hi", opts)
		map("i", ",c", "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", opts)
		map("i", ",h", "====<Space><++><ESC>7hi", opts)
		map("i", ",p", "![](<++>) <++><Esc>11hi", opts)
		map("i", ",a", "[](<++>) <++><Esc>11hi", opts)
		map("i", ",1", "#<Space><Enter><++><Esc>kA", opts)
		map("i", ",2", "##<Space><Enter><++><Esc>kA", opts)
		map("i", ",3", "###<Space><Enter><++><Esc>kA", opts)
		map("i", ",4", "####<Space><Enter><++><Esc>kA", opts)
		map("i", ",l", "--------<Enter>", opts)
	end,
})

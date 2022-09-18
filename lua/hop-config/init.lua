require("hop").setup({
	case_insensitive = true,
})
local map = vim.api.nvim_set_keymap
-- place this in one of your configuration file(s)
map(
	"",
	"<leader><leader>f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR})<cr>",
	{}
)
map(
	"",
	"<leader><leader>F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>",
	{}
)
map(
	"",
	"<leader><leader>t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_offset = -1 })<cr>",
	{}
)
map(
	"",
	"<leader><leader>T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, hint_offset = 1 })<cr>",
	{}
)

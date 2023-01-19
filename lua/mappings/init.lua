local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- don't use <space> as leader key, because <space> is default as <Right> key.
vim.g.mapleader = " " -- leader key

--- basic keymap
-- save
map("i", ";ws", "<cmd>w<CR>", opts)
map("i", ";wa", "<cmd>wa<CR>", opts)
map("n", "<leader>ws", ":w<CR>", opts)
map("n", "<leader>wa", ":wa<CR>", opts)
-- visual mode
-- move line
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- execute lua all script files
map("n", "<leader>ss", ":luafile %<CR>", opts)
map("n", "<leader>sw", "<cmd>w<CR><cmd>luafile %<CR>", opts)
map("n", "<leader>sa", "<cmd>wa<CR><cmd>luafile %<CR>", opts)
-- split window
map("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
map("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
map("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width
map("n", "<leader>sx", "<C-w>q", opts) -- close current split window
-- no hightlightsearch
map("n", "<leader>hh", ":noh<CR>", opts)

-- nvim-tree mappings
map("n", "<leader>ap", ":NvimTreeFocus<CR>", opts)
map("n", "<leader>ht", ":NvimTreeClose<CR>", opts)
map("n", "<leader>af", ":NvimTreeFindFile<CR>", opts)

--- barbar mappings
-- new tab
map("n", "<leader>nn", ":tabnew<CR>", opts)
-- Move to previous/next
map("n", "[b", ":BufferPrevious<CR>", opts)
map("n", "]b", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<leader><<", ":BufferMovePrevious<CR>", opts)
map("n", "<leader>>>", ":BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "[B", ":BufferGoto 1<CR>", opts)
map("n", "]B", ":BufferLast<CR>", opts)
map("n", "<leader>b2", ":BufferGoto 2<CR>", opts)
map("n", "<leader>b3", ":BufferGoto 3<CR>", opts)
map("n", "<leader>b4", ":BufferGoto 4<CR>", opts)
map("n", "<leader>b5", ":BufferGoto 5<CR>", opts)
map("n", "<leader>b6", ":BufferGoto 6<CR>", opts)
map("n", "<leader>b7", ":BufferGoto 7<CR>", opts)
map("n", "<leader>b8", ":BufferGoto 8<CR>", opts)
map("n", "<leader>b9", ":BufferGoto 9<CR>", opts)
-- Close buffer
map("n", "[w", ":BufferClose<CR>", opts)
map("n", "<leader>bc", ":BufferClose!<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
map("n", "<leader>co", ":BufferCloseAllButCurrent<CR>", opts)
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<leader>bp", ":BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Telescope mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

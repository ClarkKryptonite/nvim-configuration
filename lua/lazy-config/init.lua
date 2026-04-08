local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	"EdenEast/nightfox.nvim",
	"kyazdani42/nvim-tree.lua", -- file explorer
	"rcarriga/nvim-notify",
	-- a statusline sritten in lua
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"romgrk/barbar.nvim", -- tabs for neovim
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
	},
	-- "nvim-treesitter/nvim-treesitter-refactor",
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	"windwp/nvim-autopairs",
	"lewis6991/impatient.nvim", -- Speed up loading Lua modules in Neovim to improve startup time.
	"Shatur/neovim-session-manager", -- Manage sessions like folders in VSCode

	-- rest client, like postman, paw
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
			"j-hui/fidget.nvim",
		},
	}, -- rest client

	-- managing & installing lsp servers, linter & formatters
	{
		"mason-org/mason-lspconfig.nvim", --> mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} }, -- Companion plugin for lsp-config, allows us to seamlesly install language servers
			"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
		},
	},

	-- linters
	"mfussenegger/nvim-lint",
	-- formatters
	"mhartington/formatter.nvim",

	-- formatting & linting
	-- {
	--     "jay-babu/mason-null-ls.nvim",
	--     event = { "BufReadPre", "BufNewFile" },
	--     dependencies = {
	--         "williamboman/mason.nvim",
	--         "nvimtools/none-ls.nvim",
	--     },
	-- },

	-- autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp

	-- snippet
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"onsails/lspkind-nvim", -- vscode-like pictograms for neovim lsp completion items

	-- tpope's plugins that should be part of vim
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-commentary",

	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"dhruvasagar/vim-table-mode",
	"mzlogin/vim-markdown-toc",
	"ferrine/md-img-paste.vim",

	-- git
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",

	-- nvim motions on speed
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	},
})

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("kyazdani42/nvim-web-devicons") -- enable icons
	use("EdenEast/nightfox.nvim")
	use("kyazdani42/nvim-tree.lua") -- file explorer
	use("rcarriga/nvim-notify")
	use("nvim-lualine/lualine.nvim") -- a statusline sritten in lua
	use("romgrk/barbar.nvim") -- tabs for neovim
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-lua/plenary.nvim") -- require by telescope, neovim-session-manager, rest
	use("nvim-telescope/telescope.nvim") -- Find, Filter, Preview, Pick. All lua, all the time.
	use("windwp/nvim-autopairs")
	use("lewis6991/impatient.nvim") -- Speed up loading Lua modules in Neovim to improve startup time.
	use("Shatur/neovim-session-manager") -- Manage sessions like folders in VSCode

	-- rest client, like postman, paw
	use("NTBBloodbath/rest.nvim") -- rest client

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client

	-- managing & installing lsp servers, linter & formatters
	use({ "williamboman/mason.nvim" }) -- Companion plugin for lsp-config, allows us to seamlesly install language servers
	use("williamboman/mason-lspconfig.nvim") --> mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
	use("jayp0521/mason-null-ls.nvim") --> mason-null-ls bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp

	-- snippet
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind-nvim") -- vscode-like pictograms for neovim lsp completion items
	use("rafamadriz/friendly-snippets")

	-- tpope's plugins that should be part of vim
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-commentary" })

	-- markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({ "dhruvasagar/vim-table-mode" })
	use({ "mzlogin/vim-markdown-toc" })
	use({ "ferrine/md-img-paste.vim" })

	-- git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- nvim motions on speed
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})
end)

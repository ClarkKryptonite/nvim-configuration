return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons' -- enable icons
    use 'EdenEast/nightfox.nvim'
    use 'kyazdani42/nvim-tree.lua' -- file explorer
    use 'rcarriga/nvim-notify'
    use 'nvim-lualine/lualine.nvim' -- a statusline sritten in lua
    use 'romgrk/barbar.nvim' -- tabs for neovim
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use {
        'nvim-telescope/telescope.nvim', -- Find, Filter, Preview, Pick. All lua, all the time.
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use("windwp/nvim-autopairs")

    -- LSP plugins
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'williamboman/nvim-lsp-installer' -- Companion plugin for lsp-config, allows us to seamlesly install language servers
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind-nvim' -- vscode-like pictograms for neovim lsp completion items
end)

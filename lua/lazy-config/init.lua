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
    "kyazdani42/nvim-web-devicons", -- enable icons
    "EdenEast/nightfox.nvim",
    "kyazdani42/nvim-tree.lua",     -- file explorer
    "rcarriga/nvim-notify",
    "nvim-lualine/lualine.nvim",    -- a statusline sritten in lua
    "romgrk/barbar.nvim",           -- tabs for neovim
    { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-lua/plenary.nvim",         -- require by telescope, neovim-session-manager, rest
    "nvim-telescope/telescope.nvim", -- Find, Filter, Preview, Pick. All lua, all the time.
    "windwp/nvim-autopairs",
    "lewis6991/impatient.nvim",      -- Speed up loading Lua modules in Neovim to improve startup time.
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

    -- configuring lsp servers
    "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client

    -- managing & installing lsp servers, linter & formatters
    "williamboman/mason.nvim",           -- Companion plugin for lsp-config, allows us to seamlesly install language servers
    "williamboman/mason-lspconfig.nvim", --> mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.

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
    "L3MON4D3/LuaSnip",         -- Snippets plugin
    "onsails/lspkind-nvim",     -- vscode-like pictograms for neovim lsp completion items
    "rafamadriz/friendly-snippets",

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

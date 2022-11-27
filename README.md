# nvim-configuration

Neovim configuration

<!-- vim-markdown-toc Marked -->

- [Preparation](#preparation)
  - [Packer --- package manager](#packer-----package-manager)
  - [nvim-tree plugin --- file manager](#nvim-tree-plugin-----file-manager)
  - [barbar plugin --- toast hint](#barbar-plugin-----toast-hint)
  - [telescope --- global search](#telescope-----global-search)
- [LSP-config](#lsp-config)
  - [~~nvim-lspconfig~~ --- use mason-lspconfig instead](#~~nvim-lspconfig~~-----use-mason-lspconfig-instead)
  - [~~nvim-lsp-installer~~ --- use mason instead](#~~nvim-lsp-installer~~-----use-mason-instead)
  - [null-ls](#null-ls)
  - [mason-lspconfig --- lsp configuration](#mason-lspconfig-----lsp-configuration)
- [Markdown](#markdown)
  - [markdow-preview](#markdow-preview)
- [Git](#git)
  - [gitsingns --- show different label in vim](#gitsingns-----show-different-label-in-vim)

<!-- vim-markdown-toc -->

## Preparation

### Packer --- package manager

1. On Path `~`, exec command `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim` to install packer.nvim
2. Go to vim to exec

```shell
:w
:PackerSync
:luafile %
```

### nvim-tree plugin --- file manager

ensure that you use nerd-font in terminal

1. install
   `brew tap homebrew/cask-fonts`
   `brew install --cask font-hack-nerd-font`
2. iterm font
   switch to 'Hack Nerd Font Mono'

### barbar plugin --- toast hint

If you use mac, <A-.> means <ESC-.>.
And you shoud hold <ESC> key for a while.

### telescope --- global search

ensure fd(replace find command) & ripgrep(replace grep command) has installed.

1. `brew install fd`
2. `brew install ripgrep`

## LSP-config

### ~~nvim-lspconfig~~ --- use mason-lspconfig instead

use [nvim-lsp-installer](#nvim-lsp-installer) instead.
~~after install nvim-lspconfig plugin, ensure use right node version.~~
~~1. check current node version.~~
~~`nvm version`~~
~~`nvm default [version>15]`~~
~~`nvm use [version>15]`~~
~~2. install language server e.g. pyright~~
~~`npm i -g pyright`~~
~~3. load configuration~~
~~see github -> [https://github.com/neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)~~
~~4. open a py file to check Lsp is installed successfully~~
~~input `:LspInfo`~~

### ~~nvim-lsp-installer~~ --- use mason instead

### null-ls

You can usc nvim-lsp-installer to install certain language server, which has already support formatting.

To run built-in sources, the command specified below must be available on your $PATH and visible to Neovim. For example, to check if stylua is available, run the following (Vim, not Lua) command:

```vimrc
" should echo 1 if available (and 0 if not)
:echo executable("stylua")
```

if not, you can use homebrew to install.

e.g.
`brew install stylua`

### mason-lspconfig --- lsp configuration

There's two details you should notice.

1. set certain language server

```lua
require("mason-lspconfig").setup({
    ensure_installed = {
        "sumneko_lua",
        "bashls",
        "emmet_ls",
        "pyright",
        "clangd",
        "kotlin_language_server",
        "jdtls",
    },
})
```

2. read mason-lspconfig help documentation to bind key in certain server

```lua
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            on_attach = common_on_attach,
        })
    end,
})
```

## Markdown

### markdow-preview

Pay attention to keymap filetype code.

```lua
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = vim.api.nvim_create_augroup("MarkdownSnippet", { clear = true }),
	callback = function()

	end,
})
```

## Git

### gitsingns --- show different label in vim

Do not remap '[c' & ']c', beacause it's default git navigation key in nvim

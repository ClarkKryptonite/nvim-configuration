# nvim-configuration
Neovim configuration
- [nvim-configuration](#nvim-configuration)
  - [Preparation](#preparation)
    - [Packer](#packer)
    - [nvim-tree plugin](#nvim-tree-plugin)
    - [nvim-lspconfig](#nvim-lspconfig)
    - [barbar plugin](#barbar-plugin)
    - [telescope](#telescope)
    - [nvim-lsp-installer](#nvim-lsp-installer)

## Preparation
### Packer
1. On Path `~`, exec command `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim` to install packer.nvim
2. Go to vim to exec
```shell
:w
:PackerSync
:luafile %
```
### nvim-tree plugin
ensure that you use nerd-font in terminal
1. install
`brew tap homebrew/cask-fonts`
`brew install --cask font-hack-nerd-font`
2. iterm font
switch to 'Hack Nerd Font Mono'

### nvim-lspconfig
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

### barbar plugin
If you use mac, <A-.> means <ESC-.>.
And you shoud hold <ESC> key for a while.

### telescope
ensure fd(replace find command) & ripgrep(replace grep command) has installed.
1. `brew install fd`
2. `brew install ripgrep`

### nvim-lsp-installer

### null-ls
To run built-in sources, the command specified below must be available on your $PATH and visible to Neovim. For example, to check if stylua is available, run the following (Vim, not Lua) command:
```vimrc
" should echo 1 if available (and 0 if not)
:echo executable("stylua")
```
if not, you can use homebrew to install.
e.g.
`brew install stylua`

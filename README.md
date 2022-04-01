# nvim-configuration
Neovim configuration

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

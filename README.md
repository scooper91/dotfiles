# dotfiles

## Setup

### Colours

 - Set terminal colour scheme to "Solarized Dark" and palette to "Solarized"

### Bash

 - Symlink `.bash_aliases` to `~/.bash_aliases` (sourced in `.zshrc`)

### Vim

 - Install vim (gVim, macVim, etc)
 - Symlink the correct `.vimrc` to `~/.vimrc`
 - Install [Vundle](https://github.com/VundleVim/Vundle.vim)
 - Install [Vim Colours Solarized](https://github.com/altercation/vim-colors-solarized)
 - From Vim, run `:PluginInstall` to install plugins
 - Install [Ag](https://github.com/ggreer/the_silver_searcher) to be able to use the Vim-Ag plugin

### Zsh

 - Install [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
 - Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
 - Symlink `.zshrc` to `~/.zshrc`
 - Install & use [Powerline Fonts](https://github.com/powerline/fonts) to get the icons in the Spaceship Zsh theme
 - Install [Spaceship](https://denysdovhan.com/spaceship-prompt/#installing)
 - Run `source ~/.zshrc`

### TMUX

 - Install [TPM](https://github.com/tmux-plugins/tpm#installation)
 - Symlink `.tmux.conf` to `~/.tmux.conf`
 - Source TMUX conf
 - Install plugins using `<leader>I`

  ## TODO

   - Create `vimrc` for Windows and Linux (I don't think they all work with the same `vimrc` very well)
   - Add `.bashrc`
   - Install Oh My Zsh in the same location (osx installs in a different place to Linux :( )

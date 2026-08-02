# dotfiles

## Setup

### Git

 - Install Git
 - Install [Delta](https://dandavison.github.io/delta/installation.html)
 - Symlink `.gitconfig` to `~/.gitconfig`
 - Add `~/.gitconfig.local` containing anything that doesn't want to be committed (e.g. email)

### Colours

- Use [Gogh](https://gogh-co.github.io/Gogh) to install the `Base2Tone_Space` theme.

### Bash

 - Symlink `.bash_aliases` to `~/.bash_aliases` (sourced in `.zshrc`)

### Vim

 - Install vim (gVim, macVim, etc). `vim-gtk3` may be required in order to get the system clipboard working (`vim --version` should have `+clipboard` if it is working).
 - Symlink the correct `.vimrc` to `~/.vimrc`
 - Install [Vundle](https://github.com/VundleVim/Vundle.vim)
 - From Vim, run `:PluginInstall` to install plugins
 - Install [Ag](https://github.com/ggreer/the_silver_searcher) to be able to use the Vim-Ag plugin

### Zsh

 - Install [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
 - Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
 - Symlink `.zshrc` to `~/.zshrc`
 - Install & use [Powerline Fonts](https://github.com/powerline/fonts) to get the icons in the Spaceship Zsh theme
 - Install [Spaceship](https://denysdovhan.com/spaceship-prompt/#installing)
 - Ensure `spaceship.zsh-theme` is in the custom themes directory in `~/.oh-my-zsh`
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

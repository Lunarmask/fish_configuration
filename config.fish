#     __                           __  ___           __
#    / /   __  ______  ____ ______/  |/  /___ ______/ /__
#   / /   / / / / __ \/ __ `/ ___/ /|_/ / __ `/ ___/ //_/
#  / /___/ /_/ / / / / /_/ / /  / /  / / /_/ (__  ) ,<
# /_____/\__,_/_/ /_/\__,_/_/  /_/  /_/\__,_/____/_/|_|_____
#                                                     /____/
## FISH CONFIG by Lunarmask_

# ---------------------
#   INITIALIZE PATHS
# ---------------------

set NVM_DIR "$HOME/.nvm"
set -x XDG_CONFIG_HOME "$HOME/.config"

# ASDF version manager
source ~/.asdf/asdf.fish

# ---------------------
#  DIRECTORIES ALIASES
# ---------------------

set FDIR $XDG_CONFIG_HOME/fish
set BDIR $XDG_CONFIG_HOME/bash
set ADIR $XDG_CONFIG_HOME/alacritty
set TDIR $XDG_CONFIG_HOME/tmux
set NDIR $XDG_CONFIG_HOME/nvim
set PDIR $XDG_CONFIG_HOME/personal
set VFDIR $XDG_CONFIG_HOME/vifm
set FEDIR $XDG_CONFIG_HOME/feh

# ---------------------
#    CONFIG ALIASES
# ---------------------

set FRC $FDIR/config.fish
set FA  $FDIR/alias.fish
set BRC $BDIR/bashrc
set BA  $BDIR/alias.bash
set ZRC $HOME/.zshrc

set ARC $ADIR/alacritty.yml
set TRC $TDIR/tmux.conf
set NRC $NDIR/init.vim
set FEK $FEDIR/feh/keys
set FET $FEDIR/feh/themes
set VFRC $FMDIR/vifmrc

# ---------------------
#      ENV SETTERS
# ---------------------

# Change this to proper machine name
set -x MACHINE "home_desktop"

set -x SHELL (which fish)
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x BROWSER "firefox"
set -x TERMINAL "alacritty"
set -x FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

if test -e /usr/bin/bat
  set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

if test -e $ADIR/active_colorscheme
  set -x COLORSCHEME (cat $ADIR/active_colorscheme)
end

if test -e $ADIR/current_font
  set -x FONTSET (cat $ADIR/current_font)
end

# ---------------------
#  Additional Sourcing
# ---------------------

if test -e $FDIR/alias.fish; source $FDIR/alias.fish; end
if test -e $PDIR/alias.fish; source $PDIR/alias.fish; end

# Enable vi modes
fish_vi_key_bindings


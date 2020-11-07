## FISH CONFIG from Lunarmask_


# PATHS
set PATH "$HOME/.rbenv/bin:$PATH"
set NVM_DIR "$HOME/.nvm"
set -x XDG_CONFIG_HOME "$XDG_CONFIG_HOME"

# DIRECTORIES
set GAMES "/mnt/GAME_DRIVE"
set MEDIA "/mnt/MEDIA_DRIVE"
set FDIR "$XDG_CONFIG_HOME/fish/"
set ADIR "$XDG_CONFIG_HOME/alacritty/"
set TDIR "$XDG_CONFIG_HOME/tmux/"

# CONFIGS
set FRC "$XDG_CONFIG_HOME/fish/config.fish"
set FA "$XDG_CONFIG_HOME/fish/alias.fish"
set BRC "$HOME/.bashrc"
set BP "$HOME/.bash_profile"
set BA "$HOME/.bash_alias"

# SETTERS
set -x SHELL (which fish)
set -x MACHINE "home_desktop"
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x BROWSER "firefox"
set -x TERMINAL "alacritty"
set -x COLORSCHEME (cat $XDG_CONFIG_HOME/alacritty/active_colorscheme)
set -x FONTSET (cat $XDG_CONFIG_HOME/alacritty/current_font)

# Sourcing auxilliary alias file
source "$XDG_CONFIG_HOME/fish/alias.fish"
source "$XDG_CONFIG_HOME/personal/alias.fish"

fish_vi_key_bindings

set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
#status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and rbenv init - | source

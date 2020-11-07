# ALIAS LIST FOR FISH SHELL

alias copy "xsel -i -b"
alias paste "xsel -o -b"
alias copy-select "xsel -i -p"
alias paste-select "xsel -o -p"

alias less "less -r"

# LS MAPPINGS

alias l "ls -AF --color --group-directories-first"
alias ld "ls -AF --color --group-directories-first | grep '/\$'"
alias ll "ls -lAhF --color --group-directories-first"
alias lld "ls -lAhF --color --group-directories-first | grep '/\$'"
alias llr "ls -lAhFtc --color | head -10"
alias lll "ls -lAhF --group-directories-first | less"

# TMUX

abbr t "tmux"
abbr ta "tmux attach -t 0"
abbr tls "tmux ls"
abbr ts "tmux source-file ~/.config/tmux/tmux.conf"

# GIT

abbr g "git"
abbr ga "git add"
abbr ga. "git add ."
abbr gst "git status"
abbr gbr "git branch"
abbr gbra "git branch -a"
abbr gco "git checkout"
abbr gci "git commit"
abbr gciv "git commit -v"
abbr gd "git diff"
abbr gp "git push origin HEAD"
abbr glg "git log"
abbr gum "git checkout master; and git fetch --prune; and git rebase"

# LINUX OS TOOLS

abbr df "df -ah"
abbr du "du -ch"
abbr v "nvim"
abbr nano "nano -liED"

abbr cheat "curl cheat.sh/"

# FISH FUNCTIONS

abbr acs "alacritty_color_switcher"
abbr afs "alacritty_font_switcher"
abbr eiv "encrypted_image_viewer"

alias corona_stats "curl https://corona-stats.online/states/US\?minimal=true"

alias :q exit


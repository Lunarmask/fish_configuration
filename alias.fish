# ALIAS LIST FOR FISH SHELL

# --------------------
#    Copy and Paste
# --------------------

alias copy "xsel -i -b"
alias paste "xsel -o -b"
alias copy-select "xsel -i -p"
alias paste-select "xsel -o -p"

alias less "less -r"

# --------------------
#     LS MAPPINGS
# --------------------

alias l "ls -AF --color --group-directories-first"
alias ld "ls -AF --color --group-directories-first | grep '/\$'"
alias ll "ls -lAhF --color --group-directories-first"
alias lld "ls -lAhF --color --group-directories-first | grep '/\$'"
alias llr "ls -lAhFtc --color | head -10"
alias lll "ls -lAhF --group-directories-first | less"

# --------------------
# Directory Navigation
# --------------------

abbr gdoc "cd $HOME/Documents"
abbr gdow "cd $HOME/Downloads"
abbr gnas "cd $HOME/NAS_mount"
abbr grb "cd ~/.ruby_scripts"
abbr gex "cd ~/.elexir_scripts"

# --------------------
#         TMUX
# --------------------

abbr t "tmux"
abbr ta "tmux attach -t 0"
abbr tls "tmux ls"
abbr ts "tmux source-file $TDIR/tmux.conf"

# --------------------
#          GIT
# --------------------

abbr g "git"
abbr ga "git add"
abbr gst "git status"
abbr gbr "git branch"
abbr gbra "git branch -a"
abbr gco "git checkout"
abbr gci "git commit"
abbr gciv "git commit -v"
abbr gd "git diff"
abbr gp "git push gitlab HEAD"
abbr gpa "git push gitlab HEAD; git push bitbucket HEAD"
abbr glg "git log"
abbr gum "git checkout master; and git fetch --prune; and git rebase"

# --------------------
#      Kubernetes
# --------------------

abbr k "kubectl"
abbr kpo "kubectl get pods"
abbr khpa "kubectl get hpa"
abbr kns "kubens"
abbr kx "kubectl exec -it"

# --------------------
#     Rails server
# --------------------

abbr be "bundle exec"
abbr rs "bin/spring stop; and bin/rails s"
abbr rc "bundle exec rails c"
abbr rsp "bundle exec rspec"
abbr swarm "SIDEKIQ_PRELOAD= SIDEKIQ_COUNT=4 bundle exec sidekiqswarm"
abbr web "rake websocket_rails:start_server"

# --------------------
# FISH FUNCTIONS ALIAS
# --------------------

abbr acs "alacritty_color_switcher"
abbr afs "alacritty_font_switcher"
abbr eiv "encrypted_image_viewer"

# --------------------
#    LINUX OS TOOLS
# --------------------

# Report file system disk space usage
abbr df "df -ah"

# Estimate file space usage
abbr du "du -ch"

# Terminal Text Editors
abbr v "nvim"
abbr nano "nano -liED"

# Image Viewer
abbr f "feh"

# Video Player
abbr m "mpv --loop-playlist=inf "
abbr ma "mpv --loop-playlist=inf --vid=no *.{mp3,m4a,flac,wav}"
abbr mf "mpv --loop-playlist=inf --fs"

# File Manager
abbr vf "vifm"

# Recursively serch for file with name matching regex
abbr search "ag --silent -ug"

# Get more information for linux commands
abbr cheat "curl cheat.sh/"

# Pull Current Corona Information
alias corona_stats "curl https://corona-stats.online/states/US\?minimal=true"

# Quick Quit
alias qq exit
alias :q exit

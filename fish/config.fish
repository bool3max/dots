# vi mode
set -g fish_key_bindings fish_vi_key_bindings

# abbreviations (they are universal by default)
abbr -a p "sudo pacman"
abbr -a s "systemctl"
abbr -a vi "nvim"
abbr -a xxd "xxd -g 1 -c 10 -u" # a more sane xxd (uppercase letters, 10 columns per row, 1 byte per space)
abbr -a icat "kitty icat"
abbr -a pg "pgrep -li" # pgrep, but case-insensitive and also lists names of the matching processes along with their PIDs
abbr -a tree "tree -C" # tree but with colors
abbr -a md "mkdir -p" # mkdir but also create all missing dirs in the chain
abbr -a p3 "python3"
abbr -a venv "python3 -m venv" # virtualenv is now provided as a python3 script, this command runs an interpreter and searched sys.path for it and executes another interpreter to run it
abbr -a strings "strings -t d"
abbr -a dirsize "du -s --si" # print current directory size in human-readable format
abbr -a gs "git status"

# make as many clients as possible run wayland-natively
set -x GDK_BACKEND wayland # used by firefox and (possibly) other GTK apps
set -x QT_QPA_PLATFORM wayland-egl # used by qt5 applications
set -x _JAVA_AWT_WM_NONREPARENTING 1 # for java apps under wayland
set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1 # since QT draws the decorations by default with the wayland backend

# toolkit themes
set -x QT_STYLE_OVERRIDE 'kvantum'

# bote config
set -x BOTE_PDF_CMDLINE 'zathura %f'
set -x BOTE_EDITOR_CMDLINE 'nvim -c Goyo %f'

# more env vars
set -x EDITOR "nvim"

# a fish syntax highlighting theme which uses 4bit ansi terminal colors instead of explicit custom values
# this makes my fish theme dynamic and makes it adapt to my current 4bit terminal theme
# of course it's possible to use explicit 24bit RGB colors here as well, but I prefer them adapting to my current base16 terminal theme
set -g fish_color_normal normal
set -g fish_color_command blue --bold
set -g fish_color_quote yellow
set -g fish_color_redirection brgreen --bold
set -g fish_color_end brmagenta --bold
set -g fish_color_error red --bold
set -g fish_color_param cyan
set -g fish_color_comment bryellow
set -g fish_color_match brmagenta
set -g fish_color_selection white --background=brblack
set -g fish_color_search_match --background=green
set -g fish_color_operator magenta
set -g fish_color_escape brcyan
set -g fish_color_autosuggestion brblack
set -g fish_color_cancel black --bold
# pager colors (e.g. when autocompleting commands)
set -g fish_pager_color_progress magenta
set -g fish_pager_color_prefix magenta -u
set -g fish_pager_color_description cyan

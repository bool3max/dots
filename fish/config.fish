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
abbr -a md "mkdir -p"
abbr -a p3 "python3"
abbr -a venv "python3 -m venv" # virtualenv is now provided as a python3 script, this command runs an interpreter and searched sys.path for it and executes another interpreter to run it
abbr -a strings "strings -t d"
abbr -a dirsize "du -s --si ." # print current directory size in human-readable format
abbr -a gs "git status"

# make as many clients as possible run wayland-natively
set -x GDK_BACKEND wayland # used by firefox and (possibly) other GTK apps
set -x QT_QPA_PLATFORM wayland-egl # used by qt5 applicatiosn if qt5-wayland is installed, hopefully
set -x _JAVA_AWT_WM_NONREPARENTING 1 # for java apps under wayland
set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1 # since QT draws the decorations by default with the wayland backend

# toolkit themes
set -x QT_STYLE_OVERRIDE 'kvantum'

# bote config
set -x BOTE_PDF_CMDLINE 'zathura %f'
set -x BOTE_EDITOR_CMDLINE 'nvim -c Goyo %f'

# more env vars
set -x EDITOR "nvim"

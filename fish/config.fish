# vi mode
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_cursor_insert "line" # default cursor is "block", however in insert mode I want it to be a line

# abbreviations
abbr -a p "sudo pacman"
abbr -a s "systemctl"
abbr -a vi "nvim"
abbr -a xxd "xxd -g 1 -c 10 -u" # a more sane xxd (uppercase letters, 10 columns per row, 1 byte per space)
abbr -a pg "pgrep -li" # pgrep, but case-insensitive and also lists names of the matching processes along with their PIDs
abbr -a tree "tree -C" # tree but with colors
abbr -a md "mkdir -p" # mkdir but also create all missing dirs in the chain
abbr -a p3 "python3"
abbr -a venv "python3 -m venv" # virtualenv is now provided as a python3 script, this command runs an interpreter and searched sys.path for it and executes another interpreter to run it
# aliases (short functions)
alias wlc="wl-copy -n"

# hacks to get as many apps as possible to run wayland-natively
set -x QT_QPA_PLATFORM wayland-egl # required by qt5 applications
set -x MOZ_ENABLE_WAYLAND 1
set -x _JAVA_AWT_WM_NONREPARENTING 1 # to fix glitches for java UI apps under xwayland
set -x XDG_SESSION_TYPE wayland
set -x XDG_CURRENT_DESKTOP sway

# bote config
set -x BOTE_PDF_CMDLINE 'zathura %f'
set -x BOTE_EDITOR_CMDLINE 'nvim -c Goyo %f'

set -x CHROME_EXECUTABLE chromium

# more env vars
set -x EDITOR "nvim"

# tokyonight_night colorscheme (using absolute RGB (24bit) colors which fish outputs, not terminal colors)
source ~/.config/fish/fish_tokyonight_night.fish

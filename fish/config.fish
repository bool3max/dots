# vi mode
set -g fish_key_bindings fish_vi_key_bindings

# abbreviations (they are universal (-U) by default
abbr -a p "sudo pacman"
abbr -a vi "nvim"
abbr -a xxd "xxd -g 1 -c 10 -u"
abbr -a icat "kitty icat"
abbr -a pg "pgrep -li"
abbr -a tree "tree -C"
abbr -a s "systemctl"
abbr -a md "mkdir -p"

#append more paths to $PATH and also export it to the environment
set -x PATH $PATH ~/.scripts ~/.gem/ruby/2.6.0/bin

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

# kitty completions
kitty + complete setup fish | source

# more env vars
set -x EDITOR "nvim"

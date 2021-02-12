# Themeing

The themeing situation on my system is entirely based on the base-16 model (basically a standard which forces all themes within a 16-color
pallete, [see here](https://github.com/chriskempson/base16)).

I like to pick a particular base-16 compliant theme, and apply it uniformly across all applications on my system.

## kitty

`~/.config/kitty/colors.conf` contains color configuration for kitty. This file is then included in the main kitty config.

## nvim 

I use `set notermguicolors` (to make all highlight groups use only `cterm` variants) and `vim-dim` as my colorscheme. This colorscheme 
makes all highlight groups use `cterm` colors, i.e. the ones defined by the terminal emulator, i.e. the ones defined in kitty. If I ever wa
nt to use a truecolor (24bit) colorscheme, I simply `set termguicolors` and switch to the new scheme.

This way the nvim colorscheme simply reacts to kitty's colorscheme.

Similarly I use a `vim-airline` theme called simply `base16` which makes vim-airline use cterm-colors, again, matching the colors set by my
terminal.

## fish

The situation in fish is very similar. It allows for custom themes, as well as truecolor 24bit colors, but I've setup a custom theme
(in my fish config) which simply uses the default 16 colors defined by the terminal (i.e. kitty). 

Again, this way the fish colors simply react to kitty's colorscheme.

## sway

`~/.config/sway/colors` defines 16 color variables. This file is then included in the main sway config file, which uses those color variables
for syntax highlighting. Whenever I want to swap the theme, I simply alter variables in the `colors file`. 


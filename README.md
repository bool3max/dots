A collection of configuration files that I use on my desktop Arch installation.

## Colorschemes

Most of the colors are based off of [Spacegray.vim](https://github.com/ajh17/Spacegray.vim). This theme is being used in *neovim*.

The main 16 terminal ANSI colors (as well as other colors such as foregound and background, etc...) are set in *kitty* and are based off of the colors from this colorscheme.

The color situation in the shell (*fish*) is a little weird.

1. It does not set the background color for any characters that it outputs. Thus the default terminal one is always being used. 
2. The foregound colors are based on the current *fish* theme, which I didn't bother creating, thus I am just using one of the default ones. It is also possible to create a fish theme that uses 4bit ANSI color codes (by using base color ANSI escape codes), but I didn't bother. I also don't understand why this isn't the default behavior of fish, or at least why it isn't included as a color preset. 

My fish prompt uses ANSI 4bit color codes. 

Colors in sway and swaybar are also based off of Spacegray.vim.

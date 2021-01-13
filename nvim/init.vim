" vi:ft=vim
" manage plugins via Plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" colorscheme and appearance configuration
syntax on
set notermguicolors
let g:onedark_terminal_italics=1 " enable italics in the onedark theme (only has an effect when using onedark)
" dim - essentially the default cterm colorscheme of vim with some improvements
" (I've additionaly made some changes to it, such as adding italics and changing background highlights in a few places)
colorscheme dim 
let g:airline_theme='base16_atelierforest' " set airline theme to base16_atelierforest from the airline-themes repo
set fillchars=vert:┃ " alternate unicode character separator for vertical splits (horizontal splits are denoted by the statusline)
set colorcolumn=140  " show a vertical line at column 120 (useful for code guidelines)

" number lines w/ relative numbers
set number
set relativenumber

" goyo configuration
let g:goyo_width=110

" vim-smoothie vars
let g:smoothie_update_interval = 10
let g:smoothie_base_speed = 10

" enable mouse controls (useful for scrolling)
set mouse=a

" misc options
let mapleader=" "
set nowrap
set incsearch

" tab = 4 spaces
filetype indent plugin on
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

" alternative fold method based on the treesitter implementation
set foldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99 " keep everything open

" natural splits and a better default preview size
set previewheight=20
set splitbelow
set splitright

" enable nvim-treesitter-based syntax highlighting
lua <<EOF
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
  indent = {
    enable = false -- broken as fuck currently
  }
}

local lualine = require('lualine')
lualine.status()
lualine.theme = 'forest_night'

EOF

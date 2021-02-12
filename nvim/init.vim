" vi:ft=vim
" manage plugins via Plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

" colorscheme and appearance configuration
syntax on
set notermguicolors
let g:onedark_terminal_italics=1 " enable italics in the onedark theme (only has an effect when using onedark)
" dim - essentially the default cterm colorscheme of vim with some improvements
" (I've additionaly made some changes to it, such as adding italics and changing background highlights in a few places)
colorscheme dim
let g:airline_theme='base16' " set airline theme to base16_atelierforest from the airline-themes repo
let g:airline#extensions#tabline#enabled = 1
set fillchars=vert:┃ " alternate unicode character separator for vertical splits (horizontal splits are denoted by the statusline)
set colorcolumn=140  " show a vertical line at column 140 (useful for code guidelines) - this has its own highlight group

" number lines w/ relative numbers
set number relativenumber

" goyo configuration
let g:goyo_width=140
let g:goyo_linenr=1

" vim-smoothie vars
let g:smoothie_update_interval = 10
let g:smoothie_base_speed = 10

" enable mouse controls (useful for scrolling)
set mouse=a

" misc options
let mapleader=" "
set ignorecase smartcase " ignore case in searches, unless the search itself contains uppercase letters - then do an absolute search
set hidden " something to do with buffers
set nowrap " don't wrap long lines
set incsearch " update search highlight on every keystore
set scrolloff=4 " begin scrolling the file when the cursor is 4 lines away from top/bottom
                " this way your cursor is never at the very edge of the file
                " and you always have a peek at the few lines beyond it, super
                " useful and avoids the need for constant 'zz'-ing
set list listchars=eol:⤶ " show a little arrow at EOL

" tab = 4 spaces
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

" alternative fold method based on the treesitter implementation
set foldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99 " keep everything open at start

" natural splits and a better default preview size
set previewheight=20
set splitbelow
set splitright

" bindings
" navigate between window splits with Ctrl+HJKL
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

nnoremap <Leader>f :FZF<CR>

" enable nvim-treesitter-based syntax highlighting
lua <<EOF

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
  indent = {
    enable = true,
    disable = {"python"}
  }
}

EOF

" vi:ft=vim
" manage plugins via Plug
call plug#begin('~/.local/share/nvim/plugged')

" functionality 
Plug 'psliwka/vim-smoothie'
Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kdav5758/TrueZen.nvim'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs' 

" appearance
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'folke/tokyonight.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" colorscheme and appearance configuration
syntax on
set termguicolors

" colorscheme-specific configuration
let g:tokyonight_style="night" " alternate style of the tokyonight colorscheme (only has an effect when using tokyonight)
let g:tokyonight_italic_functions=1
colorscheme tokyonight

set fillchars=vert:┃ " alternate unicode character separator for vertical splits (horizontal splits are denoted by the statusline)
" set colorcolumn=140

" indent-blankline configuration
let g:indent_blankline_char="│"

" number lines w/ relative numbers
set number relativenumber

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

" navigate between tabs with Alt+HL
nnoremap <M-l> :tabnext<CR>
nnoremap <M-h> :tabprev<CR>

nnoremap <leader><C-f> :FZF<CR>
let g:user_emmet_leader_key='<C-z>'

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
    -- the indentation aspect of nvim-treesitteer still sucks major cock
    enable = true
  }
}

require('lualine').setup{
    options = {
        theme = 'tokyonight'
    }
}

require('nvim-autopairs').setup()

EOF

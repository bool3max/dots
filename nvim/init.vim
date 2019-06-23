" colorscheme configuration
syntax on
filetype plugin indent on
set termguicolors
let g:spacegray_use_italics = 1
colorscheme spacegray

" number lines w/ relative numbers
set number
set relativenumber

" enable mouse controls (useful for scrolling)
set mouse=a

" tab = 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" natural splits and a better default preview size
set previewheight=20
set splitbelow
set splitright

" custom keybindings
nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-M-j> :-tabm<CR>
nnoremap <C-M-k> :+tabm<CR>

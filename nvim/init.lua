-- lua neovim configuration

-- lazy.nvim plugin manager conf.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- install desired plugins from GitHub repos
require("lazy").setup({
    "psliwka/vim-smoothie",
    "nvim-lualine/lualine.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "numToStr/Comment.nvim",
    "mattn/emmet-vim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "steelsojka/pears.nvim",
    "jeffkreeftmeijer/vim-dim",
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}},
    "kyazdani42/nvim-web-devicons",
    "nickeb96/fish.vim",
    "junegunn/fzf",
    "junegunn/fzf.vim"
})

vim.cmd.filetype("on")
vim.cmd.filetype("plugin on")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", ":wincmd h<cr>")
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>")
vim.keymap.set("n", "<C-k>", ":wincmd k<cr>")
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>")

vim.keymap.set("n", "<M-l>", ":tabnext<cr>")
vim.keymap.set("n", "<M-h>", ":tabprev<cr>")

vim.keymap.set("n", "<leader><C-f>", ":FZF<cr>")

vim.cmd.colorscheme('tokyonight-night')

vim.g.indent_blankline_char = "▏" 

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  textobjects = {
   select = {
     enable = true,
     lookahead = true,
     keymaps = {
       ['af'] = '@function.outer',
       ['if'] = '@function.inner',
       ['ac'] = '@class.outer',
       ['ic'] = '@class.inner',
     }
   },
  },
})

require('lualine').setup{
    options = {
        theme = 'tokyonight'
    }
}

require('indent_blankline').setup({
    char = '▏', -- thin, left-aligned vertical line unicode char for indentation
    use_treesitter = true, -- fucks up and doesnt show indent lines on blank lines preceding more lines in same ctx
    show_first_indent_level = false,
    show_trailing_blankline_indent = false
})

require("pears").setup()
require('Comment').setup()

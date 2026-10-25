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
    {"declancm/cinnamon.nvim", version = "*", opts = {}},
    "nvim-lualine/lualine.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "numToStr/Comment.nvim",
    "mattn/emmet-vim",
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup()

            -- parsers to keep installed (installs missing ones, no-op otherwise)
            local ensure_installed = {
                'bash', 'c', 'css', 'fish', 'go', 'gomod', 'html',
                'javascript', 'json', 'lua', 'luadoc', 'markdown',
                'markdown_inline', 'python', 'query', 'toml', 'vim',
                'vimdoc', 'yaml',
            }
            require('nvim-treesitter').install(ensure_installed)

            -- on main, highlighting/indent are not enabled by the plugin;
            -- turn them on per-buffer via Neovim's built-in treesitter.
            -- start() resolves the parser from the buffer's filetype, so this
            -- works for any filetype with an installed parser (and is a no-op
            -- otherwise, guarded by pcall).
            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        -- indentation (experimental on main)
                        vim.bo[args.buf].indentexpr =
                            "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
    "jeffkreeftmeijer/vim-dim",
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}},
    "kyazdani42/nvim-web-devicons",
    "nickeb96/fish.vim",
    {
        "ibhagwan/fzf-lua",
        ---@module "fzf-lua"
        ---@type fzf-lua.Config|{}
        ---@diagnostic disable: missing-fields
        opts = {}
        ---@diagnostic enable: missing-fields
    },
    {"folke/zen-mode.nvim", opts = {
		window = { backdrop = 1 },
	}},
    "nvim-tree/nvim-tree.lua",
})

vim.cmd.filetype("on")
vim.cmd.filetype("plugin on")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.signcolumn="yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- keybindings
vim.g.mapleader = " "

-- switch tabs left/right
vim.keymap.set("n", "<M-l>", ":tabnext<cr>")
vim.keymap.set("n", "<M-h>", ":tabprev<cr>")

-- navigate window splits
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- create window splits
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Create vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<cr>", { desc = "Create horizontal split" })

-- FzfLua file fuzzy finder
vim.keymap.set("n", "<leader>ff", function() FzfLua.files() end)

-- toggle nvim-tree panel
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>")

vim.cmd.colorscheme('tokyonight-night')
-- override CursorLine highlight (the default one in tokyonight-night is too bright against the background)
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#222636' })

vim.g.indent_blankline_char = "▏" 

require('lualine').setup({
    options = {
        theme = 'tokyonight',
        globalstatus = false,
    },
    sections = {
        lualine_c = {{"filename", path = 1}}
    },
    inactive_sections = {
        lualine_c = {{"filename", path = 1}}
    },
    tabline = {
        lualine_a = { {"tabs", mode = 2, path = 1} },
    },
    extensions = {
        'nvim-tree', -- integrate with nvim-tree to disabled lualine in tree windows and replace it with path,
                     -- similar effect could be achieved with the `disabled_filetypes` option, but this is cleaner
    }, 
})

require("ibl").setup({
    indent = {
        char = '▏'
    }
})

require('Comment').setup()

require("cinnamon").setup({
    disabled = false,

    keymaps = {
        basic = true,
        extra = true,
    },

    options = {
        mode = "window",
      delay = 3,
    },
})

require('nvim-tree').setup({
    update_focused_file = {enable = true},
    on_attach = function (bufnr)
        local tree_api = require("nvim-tree.api") 

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        tree_api.map.on_attach.default(bufnr)
        
        -- unbind Ctrl-x which by default opens the selected file in a horizontal split, and bind it to Ctrl-s instead
        vim.keymap.del("n", "<C-x>", { buffer = bufnr })
        vim.keymap.set("n", "<C-s>", tree_api.node.open.horizontal, opts("open selected file in horizontal split"))
    end,
})

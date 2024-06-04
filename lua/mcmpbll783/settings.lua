local opts = vim.o

opts.clipboard = "unnamed"
opts.wrap = false
opts.encoding = "utf-8"
opts.number = true
opts.relativenumber = true
opts.mouse = "a"
opts.numberwidth = 1
opts.syntax = "on"
opts.cursorline = true
opts.sw = 2
-- opts.nocp = true
opts.tabstop = 2
opts.shiftwidth = 2
opts.softtabstop = 2
opts.shiftround = true
opts.expandtab = true
opts.foldmethod = "expr"
opts.foldexpr = "nvim_treesitter#foldexpr()"
opts.hidden = true
opts.hlsearch = true
opts.incsearch = true
opts.ignorecase = true
opts.smartcase = true

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<esc><esc>", ":noh<return><esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":Lazy<cr>", {})

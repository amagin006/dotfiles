vim.g.mapleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- for netrw
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.keymap.set('n', '<F2>', '<cmd>Lexplore<cr>')
-- vim.keymap.set('n', '<space><space>', '<F2>', {remap = true})
vim.keymap.set('n', '<leader><leader>', ":NvimTreeToggle<cr>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Split window
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Do not yank with x
vim.keymap.set("n", "x", '"_x')

-- Delete a word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>s', ':w<cr>')

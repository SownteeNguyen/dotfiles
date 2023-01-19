--  _____
-- |  __ \
-- | |__) |___ _ __ ___   __ _ _ __  ___
-- |  _  // _ \ '_ ` _ \ / _` | '_ \/ __|
-- | | \ \  __/ | | | | | (_| | |_) \__ \
-- |_|  \_\___|_| |_| |_|\__,_| .__/|___/
--                            | |
--                            |_|

M = {}

local Remap = require("plugins.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Tăng giá trị
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Copy and Paste
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("n", "<C-c>", "y", opts)
keymap("n", "<C-v>", "p", opts)

-- Di chuyển giữa các cửa sổ
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Thoát Insert
keymap("i", "ii", "<ESC>", opts)

-- Lưu và Rời
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)

-- Di chuyển dòng lên xuống
keymap("n", "<M-Up>", ":m-2<CR>", opts)
keymap("n", "<M-Down>", ":m+<CR>", opts)
keymap("i", "<M-Up>", "<Esc>:m-2<CR>", opts)
keymap("i", "<M-Down>", "<Esc>:m+<CR>", opts)

-- Thay đổi size cho cửa sổ
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Sử dụng h, j, k, l trong INSERT MODE
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Chuyển Buffer
keymap("n", "<TAB>", ":bnext<CR>", opts)
-- keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Chia đôi màn
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>wh", "<C-w>s", opts)

-- Clear searh when esc esc
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)

----------------------------------------------- PLUGINS -------------------------------------------

-- Expoler
keymap("n", "<C-e>", ":NvimTreeToggle<cr>", opts)

-- Color Pick
keymap("n", "<Leader>cp", ":Colortils picker<cr>", opts)
keymap("n", "<Leader>cl", ":Colortils lighten<cr>", opts)
keymap("n", "<Leader>cd", ":Colortils darken<cr>", opts)
keymap("n", "<Leader>cg", ":Colortils gradient<cr>", opts)

-- Shade
keymap("n", "<Leader>sd", ":lua require('shade').toggle()<CR>", opts)

-- Open Documentation LSP
keymap("n", "K", ":lua require('user.functions').show_documentation()<CR>", opts)

-- Telescope
keymap(
    "n",
    "<S-TAB>",
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    opts
)

-- Copilot
-- vim.api.nvim_set_keymap("i", "<TAB>", ':copilot#Accept("<CR>")', opts)
vim.cmd([[imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")]])

return M

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate tabs
keymap("n", "<S-l>", ":<C-u>tabn<CR>", opts)
keymap("n", "<S-h>", ":<C-u>tabp<CR>", opts)
keymap("n", "<C-n>", ":<C-u>tabnew %<CR>", opts)
keymap("n", "<C-p>", ":<C-u>tabclose<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Keep buffer when pasting over visual selection
keymap("v", "p", '"_dP', opts)

-- Normal --
-- Alt hjkl to move by amount --
local vjump = 6
local hjump = 12
keymap("n", "<A-h>", tostring(hjump) .. "h" , opts)
keymap("n", "<A-j>", tostring(vjump) .. "j" , opts)
keymap("n", "<A-k>", tostring(vjump) .. "k" , opts)
keymap("n", "<A-l>", tostring(hjump) .. "l" , opts)
keymap("v", "<A-h>", tostring(hjump) .. "h" , opts)
keymap("v", "<A-j>", tostring(vjump) .. "j" , opts)
keymap("v", "<A-k>", tostring(vjump) .. "k" , opts)
keymap("v", "<A-l>", tostring(hjump) .. "l" , opts)


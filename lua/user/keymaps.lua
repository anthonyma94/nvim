local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap CTRL-S
keymap("", "<C-s>", ":w<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Unmap useless keys
keymap("n", "Q", "<Nop>", opts)
keymap("n", "q", "<Nop>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

keymap("n", "<A-u>", "<C-u>", opts)
keymap("n", "<A-j>", "<C-f>", opts)
keymap("n", "<A-k>", "<C-b>", opts)
keymap("n", "<A-d>", "<C-d>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>", opts)

-- Hop (EasyMotion)
if vim.g.vscode then
    keymap("n", ";;", "<Plug>(easymotion-jumptoanywhere)", {})
    keymap("n", ";w", "<Plug>(easymotion-bd-w)", {})
    keymap("n", ";f", "<Plug>(easymotion-bd-f)", {})
    keymap("n", ";/", "<Plug>(easymotion-sn)", {})
    keymap("n", ";e", "<Plug>(easymotion-bd-e)", {})
    keymap("n", ";E", "<Plug>(easymotion-bd-E)", {})
else
    keymap("n", ";w", ":HopWordMW<CR>", opts)
    keymap("n", ";f", ":HopChar1MW<CR>", opts)
    keymap("n", ";/", ":HopPatternMW<CR>", opts)
    keymap("n", ";j", ":HopLineMW<CR>", opts)
    --     map <Leader><Leader> <Plug>(easymotion-jumptoanywhere)
    -- map <Leader>b <Plug>(easymotion-bd-w)
-- map <Leader>B <Plug>(easymotion-bd-W)
-- map <Leader>w <Plug>(easymotion-bd-w)
-- map <Leader>W <Plug>(easymotion-bd-w)
-- map <Leader>e <Plug>(easymotion-bd-e)
-- map <Leader>E <Plug>(easymotion-bd-E)
-- map <Leader>f <Plug>(easymotion-bd-f)
end

-- Insert --
-- Press jk fast to enter
keymap("i", "<A-j>", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Down>", ":m .+1<CR>", opts)
keymap("v", "<A-Up>", ":m .-2<CR>", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

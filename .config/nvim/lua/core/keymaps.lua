vim.g.mapleader = " "
vim.g.localmapleader = "\\"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap for dealing with word wrap
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", opts)
-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move text up and down
map("v", "<C-j>", ":m .+1<CR>==", opts)
map("v", "<C-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Move between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Move between buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Go to [p]revious diagnostic message" })
map("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Go to [n]ext diagnostic message" })
map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostic [q]uickfix list" })

-- Move between tabs
map("n", "<C-Left>", ":tabprevious<CR>", opts)
map("n", "<C-Right>", ":tabnext<CR>", opts)
map("n", "<C-Tab>", ":tabnext<CR>", opts)
map("n", "<S-Tab>", ":tabprevious<CR>", opts)

-- Tabs
map("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open current file in new tab" })

--- buffers
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save Buffer" })
map({ "n", "v", "i" }, "<D-s>", "<cmd>w<CR>", { desc = "Save Buffer" })

-- Updates
map("n", "<leader>ul", "<cmd>Lazy update<CR>", { desc = "Lazy Update" })
map("n", "<leader>us", "<cmd>Lazy sync<CR>", { desc = "Lazy Sync" })
map("n", "<leader>ur", ":Lazy reload ", { desc = "Reload Plugin" })

-- UI
map("n", "<leader>wL", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
map("n", "<leader>wm", "<cmd>Mason<CR>", { desc = "Open Mason" })

-- Terminal
-- map("t", "<Esc>", "<C-\\><C-n>")
-- map("t", "<A-h>", "<C-\\><C-N><C-w>h")
-- map("t", "<A-j>", "<C-\\><C-N><C-w>j")
-- map("t", "<A-k>", "<C-\\><C-N><C-w>k")
-- map("t", "<A-l>", "<C-\\><C-N><C-w>l")

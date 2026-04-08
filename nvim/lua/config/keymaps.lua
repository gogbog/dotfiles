vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local opts = { noremap = true, silent = true }

-- Localleader test (optional)
-- vim.keymap.set("n", "<localleader>t", function()
--   print("Localleader key pressed!")
-- end, { desc = "Test localleader", noremap = true, silent = true })


-- Buffer navigation
vim.keymap.set("n", "<Tab>", function() vim.cmd.bnext{count = vim.v.count1} end, { desc = "Next buffer", unpack(opts) })
vim.keymap.set("n", "<S-Tab>", function() vim.cmd.bprev{count = vim.v.count1} end, { desc = "Previous buffer", unpack(opts) })

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", unpack(opts) })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", unpack(opts) })

-- Keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered", unpack(opts) })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered", unpack(opts) })

-- Paste without losing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting clipboard", unpack(opts) })

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard", unpack(opts) })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard", unpack(opts) })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q command", unpack(opts) })

-- Run tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer", unpack(opts) })


-- Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor", unpack(opts) })

-- Split windows
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical split", unpack(opts) })
vim.keymap.set("n", "<leader>h", "<cmd>split<CR>", { desc = "Horizontal split", unpack(opts) })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split", unpack(opts) })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to split below", unpack(opts) })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to split above", unpack(opts) })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split", unpack(opts) })

-- Save current buffer
vim.keymap.set("n", "<leader>w", function()
  vim.cmd("write")
end, { desc = "Save current buffer", unpack(opts) })

-- Save all buffers
vim.keymap.set("n", "<leader>wa", function()
  vim.cmd("wall")
end, { desc = "Save all buffers", unpack(opts) })

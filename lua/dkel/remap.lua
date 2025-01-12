-- quick exit back to netrw
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- Move highlighted items as if they're warping through other lines; it should respect indentation too, but idk
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Center the cursor when moving vertically so I'm not playing "Where's Waldo" with the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- jump down by a bunch
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- jump up by a bunch
vim.keymap.set("n", "n", "nzz") -- center when searching forward
vim.keymap.set("n", "N", "Nzz") -- center when searching forward

-- After (y)anking text, retain the yanked text in the paste register as opposed to wiping it
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank stuff into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- "Don't ever press capital Q. Honestly it's the worst place in the universe." -ThePrimeagen, Dec 2022
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Stole this from Prime. Pretty sure it formats something but I don't know how to use it yet...
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Also stole this from Prime.
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

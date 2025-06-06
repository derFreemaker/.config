vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('v', "j", ":m '>+1<cr>gv=gv")
vim.keymap.set('v', "k", ":m '<-2<cr>gv=gv")

vim.keymap.set('n', "Y", "yg$")
vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

vim.keymap.set('x', "<leader>p", "\"_dp")

vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

vim.keymap.set('i', "<C-c>", "<Esc>")

vim.keymap.set('n', "Q", "<nop>")
vim.keymap.set('n', "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>e", ":Ex<CR>")

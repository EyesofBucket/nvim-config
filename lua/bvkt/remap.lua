local wk = require("which-key")

vim.g.mapleader = " "

wk.register({
p = {
    name = "Panes",
    v = { vim.cmd.Ex, "Netrw" },
  },
}, { prefix = "<leader>" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

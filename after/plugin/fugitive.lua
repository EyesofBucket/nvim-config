local wk = require("which-key")

wk.register({
    g = {
        name = "Git",
        s = { vim.cmd.Git, "Git: Status (top)" },
        v = { "Git: Status (vertical)" },
    },
}, { prefix = "<leader>" })

vim.api.nvim_set_keymap('n', '<leader>gv', ':botright vertical Git<CR>', { noremap = true, silent = true })


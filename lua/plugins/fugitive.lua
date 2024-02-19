return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gs", vim.cmd.Git , desc = "Git: Status (top)" },
        { "<leader>gv", ':botright vertical Git<CR>', desc = "Git: Status (vertical)", { noremap = true, silent = true }},
    },
}

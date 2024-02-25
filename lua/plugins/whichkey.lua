return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
        require("which-key").register({
            e = { name = "Explorer", },
            f = { name = "Fun", },
            g = { name = "Git", },
            h = { name = "Help", },
            p = { name = "Panes", },
            s = { name = "Suda", },
            u = { name = "Undotree", },
            v = { name = "Lsp", },
        }, { prefix = "<leader>" })
    end,
}

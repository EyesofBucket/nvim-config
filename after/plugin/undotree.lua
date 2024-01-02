local wk = require("which-key")

wk.register({
    u = {
        name = "Undotree",
        t = { vim.cmd.UndotreeToggle, "Undotree: Toggle" },
        f = { function()
            vim.cmd.UndotreeShow()
            vim.cmd.UndotreeFocus()
        end, "Undotree: Focus" },
    },
}, { prefix = "<leader>" })

vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1


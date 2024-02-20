return {
    "mbbill/undotree",
    event = { 'BufRead' },
    keys = {
        {
            "<leader>ut",
            vim.cmd.UndotreeToggle,
            desc = "Undotree: Toggle"
        },
        {
            "<leader>uf",
            function()
                vim.cmd.UndotreeShow()
                vim.cmd.UndotreeFocus()
            end,
            desc = "Undotree: Focus"
        },
    },
    init = function()
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_ShortIndicators = 1
    end
}

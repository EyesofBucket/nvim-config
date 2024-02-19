return {
    "mbbill/undotree",
    keys = {
        { "<leader>ut", vim.cmd.UndotreeToggle, "Undotree: Toggle" },
        { "<leader>uf", function() vim.vim.cmd.Undotrecmd.UndotreeShow() vim.cmd.UndotreeFocus() end, "Undotree: Focus" },
    },
    init = function()
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_ShortIndicators = 1
    end
}

return {
    "lambdalisue/suda.vim",
    keys = {
        { "<leader>sr", "<CMD>SudaRead<CR>", desc = "Suda: Read" },
        { "<leader>sw", "<CMD>SudaWrite<CR>", desc = "Suda: Write" },
    },
    init = function()
        vim.g.suda_smart_edit = 1

        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            pattern = {"*"},
            callback = function() vim.opt.readonly = false end,
        })
    end
}

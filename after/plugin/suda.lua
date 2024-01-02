local wk = require("which-key")

vim.g.suda_smart_edit = 1

wk.register({
    s = {
        name = "Suda",
        r = { "<CMD>SudaRead<CR>", "Suda: Read" },
        w = { "<CMD>SudaWrite<CR>", "Suda: Write" },
    },
}, { prefix = "<leader>" })

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*"},
  callback = function() vim.opt.readonly = false end,
})

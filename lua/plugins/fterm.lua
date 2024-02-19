return {
    "numToStr/FTerm.nvim",
    opts = {
        border = 'rounded'
    },
    keys = {
        { '<C-Space>', '<CMD>lua require("FTerm").toggle()<CR>', 'n', desc = "FTerm: Toggle" },
        { '<C-Space>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', 't', desc = "FTerm: Toggle" },
    },
}

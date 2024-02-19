return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        hijack_netrw = false
    },
    keys = {
        { "<leader>et", function() require("nvim-tree.api").tree.toggle({focus = false}) end, desc = "Explorer: Toggle" },
        { "<leader>ef", vim.cmd.NvimTreeFocus, "Explorer: Focus" },
    },
}

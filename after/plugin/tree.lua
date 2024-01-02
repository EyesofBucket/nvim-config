local api = require("nvim-tree.api")
local wk = require("which-key")

wk.register({
    e = {
        name = "Explorer",
        t = { function() api.tree.toggle({focus = false}) end, "Explorer: Toggle" },
        f = { vim.cmd.NvimTreeFocus, "Explorer: Focus" },
    },
}, { prefix = "<leader>" })

require("nvim-tree").setup({
    hijack_netrw = false
})

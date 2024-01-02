local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
    p = {
        f = { builtin.find_files, "Telescope: Files" },
        s = { builtin.live_grep, "Telescope: Grep" },
        g = { builtin.git_files, "Telescope: Git" },
        ["?"] = { builtin.help_tags, "Telescope: Help" },
    },
}, { prefix = "<leader>" })

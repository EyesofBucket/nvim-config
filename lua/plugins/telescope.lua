return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
    },
    version = "0.1.3",
    keys = {
        { "<leader>pf", function() require('telescope.builtin').find_files() end, desc = "Telescope: Files" },
        { "<leader>ps", function() require('telescope.builtin').live_grep() end, desc = "Telescope: Grep" },
        { "<leader>pg", function() require('telescope.builtin').git_files() end, desc = "Telescope: Git" },
        { "<leader>p?", function() require('telescope.builtin').help_tags() end, desc = "Telescope: Help" },
    },
}

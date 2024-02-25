return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
    },
    keys = {
        {
            "<leader>pf",
            function()
                require('telescope.builtin').find_files()
            end,
            desc = "Telescope: Files"
        },
        {
            "<leader>ps",
            function()
                require('telescope.builtin').live_grep()
            end,
            desc = "Telescope: Grep"
        },
        {
            "<leader>pg",
            function()
                require('telescope.builtin').git_files()
            end,
            desc = "Telescope: Git"
        },
        {
            "<leader>hh",
            function()
                local open_in_right_split = function(prompt_bufnr)
                    local selection = require('telescope.actions.state').get_selected_entry()
                    require('telescope.actions').close(prompt_bufnr)
                    vim.cmd.help(selection.value)
                    vim.cmd.wincmd('L')
                end

                require('telescope.builtin').help_tags({
                    attach_mappings = function(_, map)
                        map('i', '<CR>', open_in_right_split)
                        map('n', '<CR>', open_in_right_split)
                        return true
                    end
                })
            end,
            noremap = true,
            silent = true,
            desc = "Help: Neovim"
        },
        {
            "<leader>hm",
            function()
                local open_in_right_split = function(prompt_bufnr)
                    local selection = require('telescope.actions.state').get_selected_entry()
                    require('telescope.actions').close(prompt_bufnr)
                    vim.cmd.help(selection.value)
                    vim.cmd.wincmd('L')
                end

                require('telescope.builtin').man_pages({
                    attach_mappings = function(_, map)
                        map('i', '<CR>', open_in_right_split)
                        map('n', '<CR>', open_in_right_split)
                        return true
                    end
                })
            end,
            noremap = true,
            silent = true,
            desc = "Help: Man"
        },
    },
}

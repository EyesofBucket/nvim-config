return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        transparent_background = true,
        show_end_of_buffer = true,
        custom_highlights = function (colors)
            return {
                ["@text.strong"] = { fg = colors.sapphire },
                ["@text.emphasis"] = { fg = colors.green},
            }
        end
    },
    init = function()
        vim.cmd.colorscheme "catppuccin"
    end,
}

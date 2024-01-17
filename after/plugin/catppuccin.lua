require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = true,
    custom_highlights = function (colors)
        return {
            ["@text.strong"] = { fg = colors.sapphire },
            ["@text.emphasis"] = { fg = colors.green},
        }
    end
})
vim.cmd.colorscheme "catppuccin"

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "nvim-lua/plenary.nvim",
        "ixru/nvim-markdown",
    },
    opts = {
        disable_frontmatter = true,
        workspaces = {
            {
                name = "EyesofBucket",
                path = "~/Obsidian/EyesofBucket",
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 0,
        },
    },
}

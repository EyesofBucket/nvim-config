return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "dockerfile",
                    "git_config",
                    "git_rebase",
                    "gitcommit",
                    "gitignore",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "nix",
                    "passwd",
                    "python",
                    "query",
                    "ssh_config",
                    "toml",
                    "vim",
                    "vimdoc",
                    "yaml"
                },
                sync_install = false,
                additional_vim_regex_highlighting = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/playground",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        cmd = "TSPlaygroundToggle",
    },
}

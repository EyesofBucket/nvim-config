local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "nvim-lualine/lualine.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "numToStr/FTerm.nvim",
    "eandrju/cellular-automaton.nvim",
    "lambdalisue/suda.vim",
    "ixru/nvim-markdown",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    { "nvim-telescope/telescope.nvim", version = "0.1.3" },
    { "catppuccin/nvim", name = "catppuccin" },
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
    { "epwalsh/obsidian.nvim", version = "*" },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
            }
        end
    },
})

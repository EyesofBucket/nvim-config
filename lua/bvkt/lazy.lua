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
    {
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
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            hijack_netrw = false
        },
        keys = {
            { "<leader>et", function() require("nvim-tree.api").tree.toggle({focus = false}) end, desc = "Explorer: Toggle" },
            { "<leader>ef", vim.cmd.NvimTreeFocus, "Explorer: Focus" },
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>ut", vim.cmd.UndotreeToggle, "Undotree: Toggle" },
            { "<leader>uf", function() vim.vim.cmd.Undotrecmd.UndotreeShow() vim.cmd.UndotreeFocus() end, "Undotree: Focus" },
        },
        init = function()
            vim.g.undotree_WindowLayout = 2
            vim.g.undotree_ShortIndicators = 1
        end
    },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git , desc = "Git: Status (top)" },
            { "<leader>gv", ':botright vertical Git<CR>', desc = "Git: Status (vertical)", { noremap = true, silent = true }},
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        keys = {
            { "<leader>pm", "<CMD>Mason<CR>", desc = "Open Mason" },
        },
        config = function()
            local lspconfig = require("lspconfig")

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                end,
            })

            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            local default_setup = function(server)
                require('lspconfig')[server].setup({
                    capabilities = lsp_capabilities,
                })
            end

            local mason = require("mason")
            local mason_lspconfig  = require("mason-lspconfig")

            mason.setup()
            mason_lspconfig.setup()
            mason_lspconfig.setup_handlers {
                default_setup
            }

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-e>'] = cmp.mapping.abort(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end,
    },
    "L3MON4D3/LuaSnip",
    {
        "numToStr/FTerm.nvim",
        opts = {
            border = 'rounded'
        },
        keys = {
            { '<C-Space>', '<CMD>lua require("FTerm").toggle()<CR>', 'n', desc = "FTerm: Toggle" },
            { '<C-Space>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', 't', desc = "FTerm: Toggle" },
        },
    },
    {
        "eandrju/cellular-automaton.nvim",
        keys = {
            { "<leader>fm", "<CMD>CellularAutomaton make_it_rain<CR>", desc = "Make it Rain" },
            { "<leader>fg", "<CMD>CellularAutomaton game_of_life<CR>", desc = "Game of Life" },
            { "<leader>fs", "<CMD>CellularAutomaton scramble<CR>", desc = "Scramble" },
        },
    },
    {
        "lambdalisue/suda.vim",
        keys = {
            { "<leader>sr", "<CMD>SudaRead<CR>", desc = "Suda: Read" },
            { "<leader>sw", "<CMD>SudaWrite<CR>", desc = "Suda: Write" },
        },
        init = function()
            vim.g.suda_smart_edit = 1

            vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
                pattern = {"*"},
                callback = function() vim.opt.readonly = false end,
            })
        end
    },
    { "ixru/nvim-markdown" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "dockerfile", "html", "markdown", "markdown_inline", "nix", "javascript", "json", "git_config", "git_rebase", "gitcommit", "gitignore", "passwd", "ssh_config", "toml", "yaml" },
                sync_install = false,
                additional_vim_regex_highlighting = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        "nvim-treesitter/playground",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        cmd = "TSPlaygroundToggle",
    },
    {
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
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            disable_frontmatter = true
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        },
        config = function(_, opts)
            require("harpoon"):setup(opts)
        end,
        keys = {
            { "<leader>a", function() require("harpoon"):list():append() end, desc = "Mark file", },
            { "<leader>ph", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu", },

            { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Jump to 1", },
            { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Jump to 2", },
            { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Jump to 3", },
            { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Jump to 4", },

            { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Jump to previous", },
            { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Jump to next", },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
})

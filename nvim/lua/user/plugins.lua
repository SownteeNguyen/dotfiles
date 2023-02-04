local plugins = {
    -- Plugin manager
    ["wbthomason/packer.nvim"] = {},

    -- Coloscheme
    ["catppuccin/nvim"] = {
        as = "catppuccin",
        config = function()
            require("ui.colorscheme.catppuccin")
        end,
    },
    ["folke/tokyonight.nvim"] = {
        config = function()
            require("ui.colorscheme.tokyonight")
        end,
    },

    -- File explorer
    ["nvim-tree/nvim-tree.lua"] = {
        cmd = "NvimTreeToggle",
        requires = { "nvim-tree/nvim-web-devicons" },
        tag = "nightly",
        config = function()
            require("plugins.nvimtree")
        end,
    },

    -- Icons
    ["kyazdani42/nvim-web-devicons"] = {
        config = function()
            require("plugins.nvim-webdev-icons")
        end,
    },

    -- Tabs
    ["akinsho/bufferline.nvim"] = {
        tag = "v3.*",
        requires = "kyazdani42/nvim-web-devicons",
        event = "BufRead",
        config = function()
            require("ui.bufferline.bufferline")
        end,
    },
    ["moll/vim-bbye"] = {},

    -- Statusline
    ["nvim-lualine/lualine.nvim"] = {
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("ui.statusline.lualine")
        end,
    },

    -- Treesitter
    ["nvim-treesitter/nvim-treesitter"] = {
        config = function()
            require("plugins.treesitter")
        end,
    },
    ["p00f/nvim-ts-rainbow"] = {},
    ["nvim-treesitter/playground"] = {},

    -- Auto closing
    ["windwp/nvim-autopairs"] = {
        config = function()
            require("plugins.autopairs")
        end,
    },
    ["windwp/nvim-ts-autotag"] = {},

    -- Surround words with: "({[
    ["kylechui/nvim-surround"] = {
        config = function()
            require("plugins.surround")
        end,
    },

    -- Indent Blankline
    ["lukas-reineke/indent-blankline.nvim"] = {
        config = function()
            require("plugins.blankline")
        end,
    },

    -- Whichkey
    ["folke/which-key.nvim"] = {
        config = function()
            require("plugins.whichkey")
        end,
    },

    -- Comment
    ["numToStr/Comment.nvim"] = {
        config = function()
            require("Comment").setup()
        end,
    },

    -- Telescope, Fzfinder
    ["nvim-telescope/telescope.nvim"] = {
        config = function()
            require("plugins.telescope")
        end,
    },
    ["nvim-lua/popup.nvim"] = {},
    ["dharmx/telescope-media.nvim"] = {},
    ["nvim-telescope/telescope-media-files.nvim"] = {},
    ["nvim-telescope/telescope-fzf-native.nvim"] = {},

    -- -- Dashboard
    -- ["goolord/alpha-nvim"] = {
    --     config = function()
    --         require("plugins.alpha")
    --     end,
    -- },

    -- Git
    ["lewis6991/gitsigns.nvim"] = {
        config = function()
            require("plugins.gitsigns")
        end,
    },

    -- Color
    ["NvChad/nvim-colorizer.lua"] = {
        config = function()
            require("plugins.colorize")
        end,
    },

    -- UI
    ["stevearc/dressing.nvim"] = {
        config = function()
            require("plugins.dressing")
        end,
    },

    -- Show winbar lsp
    ["SmiteshP/nvim-navic"] = {
        config = function()
            require("plugins.navic")
        end,
        requires = { "neovim/nvim-lspconfig" },
    },

    -- UI cmd, v.v
    ["folke/noice.nvim"] = {
        after = "nvim-cmp",
        config = function()
            require("plugins.noice")
        end,
    },

    -- Notification
    ["rcarriga/nvim-notify"] = {
        config = function()
            require("plugins.notify")
        end,
    },

    -- Terminal
    ["akinsho/toggleterm.nvim"] = {
        config = function()
            require("plugins.toggle-term")
        end,
    },

    -- Discord Show
    ["andweeb/presence.nvim"] = {
        config = function()
            require("plugins.presence")
        end,
    },

    -- Focus Tab
    ["andreadev-it/shade.nvim"] = {
        module = "shade",
        config = function()
            require("plugins.shade")
        end,
    },

    -- Pick Color
    ["max397574/colortils.nvim"] = {
        cmd = "Colortils",
        config = function()
            require("plugins.colortils")
        end,
    },

    -- Auto highlight same systax
    ["RRethy/vim-illuminate"] = {
        config = function()
            require("plugins.illuminate")
        end,
    },

    -- Move to line when i find line :line
    ["nacro90/numb.nvim"] = {
        config = function()
            require("plugins.numb")
        end,
    },

    -- Impatient optimize the startup time
    ["lewis6991/impatient.nvim"] = {},
    ["nvim-lua/plenary.nvim"] = {},
    ["MunifTanjim/nui.nvim"] = {},

    ----------------------------------------------------------------------------
    -- Auto completions
    ["hrsh7th/cmp-buffer"] = {}, -- buffer completions
    ["hrsh7th/cmp-path"] = {}, -- path completions
    ["hrsh7th/cmp-cmdline"] = {}, -- cmdline completions
    ["hrsh7th/cmp-nvim-lsp"] = {},
    ["hrsh7th/cmp-nvim-lua"] = {},
    ["hrsh7th/nvim-cmp"] = {
        config = function()
            require("plugins.lsp.cmp")
        end,
    },
    ["github/copilot.vim"] = {},

    -- Shippets
    ["L3MON4D3/LuaSnip"] = {},
    ["saadparwaiz1/cmp_luasnip"] = {},
    ["rafamadriz/friendly-snippets"] = {},

    -- Manage and Install LSP servers
    ["williamboman/mason-lspconfig"] = {},
    ["williamboman/mason.nvim"] = {
        config = function()
            require("plugins.lsp.mason")
        end,
    },

    -- Config for LSP Servers
    ["glepnir/lspsaga.nvim"] = {
        config = function()
            require("plugins.lsp.lspsaga")
        end,
    },
    ["onsails/lspkind.nvim"] = {},
    ["neovim/nvim-lspconfig"] = {
        config = function()
            require("plugins.lsp.lspconfig")
        end,
    },

    -- Formatting
    ["jayp0521/mason-null-ls.nvim"] = {},
    ["jose-elias-alvarez/null-ls.nvim"] = {
        config = function()
            require("plugins.lsp.null-ls")
        end,
    },
}

------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Automatically install packer
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
    PACKER_BOOTSTRAP =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.api.nvim_command("packadd packer.nvim")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local status_ok, packer = pcall(require, "packer")
if status_ok then
    packer.startup({
        function(use)
            for key, plugin in pairs(plugins) do
                if type(key) == "string" and not plugin[1] then
                    plugin[1] = key
                end
                use(plugin)
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float({ border = "rounded" })
                end,
            },
            profile = {
                enable = true,
                threshold = 0.0001,
            },
            git = {
                clone_timeout = 300,
                subcommands = {
                    update = "pull --rebase",
                },
            },
            auto_clean = true,
            compile_on_sync = true,
        },
    })
end

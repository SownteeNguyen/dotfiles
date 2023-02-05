local status_ok, catppuccin = pcall(require, "catppuccin")

if not status_ok then
    return
end

catppuccin.setup({
    flavour = "mocha",
    background = {
        -- light = "frappe",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        -- cmp = true,
        gitsigns = false,
        -- leap = true,
        -- mason = true,
        -- mini = true,
        -- noice = true,
        -- notify = true,
        -- nvimtree = true,
        treesitter_context = true,
        treesitter = true,
        -- telescope = true,
        -- lsp_trouble = true,
        -- which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "bold", "italic" },
                hints = { "bold", "italic" },
                warnings = { "bold", "italic" },
                information = { "bold", "italic" },
            },
            -- underlines = {
            --     errors = { "underline" },
            --     hints = { "underline" },
            --     warnings = { "underline" },
            --     information = { "underline" },
            -- },
        },
        navic = {
            enabled = true,
            custom_bg = "NONE",
        },
    },
    color_overrides = {
        mocha = {
            rosewater = "#F5E0DC",
            flamingo = "#F2CDCD",
            mauve = "#DDB6F2",
            pink = "#F5C2E7",
            red = "#F28FAD",
            maroon = "#E8A2AF",
            peach = "#F8BD96",
            yellow = "#FAE3B0",
            green = "#ABE9B3",
            blue = "#96CDFB",
            sky = "#89DCEB",
            teal = "#B5E8E0",
            lavender = "#C9CBFF",

            text = "#D9E0EE",
            subtext1 = "#BAC2DE",
            subtext0 = "#A6ADC8",
            overlay2 = "#C3BAC6",
            overlay1 = "#988BA2",
            overlay0 = "#6E6C7E",
            surface2 = "#6E6C7E",
            surface1 = "#575268",
            surface0 = "#302D41",

            base = "#1E1E2E",
            mantle = "#1e1e2e",
            crust = "#1e1e2e",
        },
    },
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.overlay1 },
            -- LineNr = { fg = colors.lavender },
            -- CursorLineNr = { fg = colors.lavender },
            WinSeparator = { fg = colors.text },
            -- TreesitterContext = { bg = colors.surface0 },
            -- TreesitterContextLineNumber = { bg = colors.surface0, fg = colors.lavender },
            IndentBlanklineContextChar = { fg = colors.green },
            IndentBlanklineContextStart = { sp = colors.green },
            CmpBorder = { fg = colors.lavender },
        }
    end,
})

vim.cmd([[colorscheme catppuccin]])

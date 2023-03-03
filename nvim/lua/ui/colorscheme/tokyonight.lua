local status_ok, tokyonight = pcall(require, "tokyonight")

if not status_ok then
    return
end

tokyonight.setup({
    style = "storm", -- `storm`, `moon`, `night`, `day`
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "normal",
    },
    sidebars = { "qf", "help" },
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
    on_colors = function(colors)
        colors.hint = "#4682B4"
        colors.error = "#db7676"
        colors.info = "#5fcf63"
        colors.warn = "#d9db60"
    end,
    on_highlights = function(highlights, colors)
    end,
})

-- vim.cmd("colorscheme tokyonight")

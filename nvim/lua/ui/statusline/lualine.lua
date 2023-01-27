vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.cmd [[set statusline+=%{get(b:,'gitsigns_status','')}]]

local lualine = require("lualine")
-- local navic = require("nvim-navic")
-- Color table for highlights
-- stylua: ignore

local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
}
local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = "catppuccin",
        -- offsets = { { filetype = "neo-tree", padding = 0, highlight = "Directory", separator = false } },
        icons_enabled = true,
        disabled_filetypes = {
            "alpha",
            -- "lsp-installer",
            -- "lspinfo",
            "neo-tree",
            "packer",
            -- "TelescopePrompt",
            "toggleterm",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {
            -- "os.date('%A')",
            -- "data",
            -- "require'lsp-status'.status()",
            -- { navic.get_location, cond = navic.is_available },
        },
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    winbar = {
        -- { navic.get_location, cond = navic.is_available },
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 2, right = 1 }, -- We don't need space before this
})

ins_left({
    -- mode component
    function()
        return "  SownteeNguyen"
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], gui = "bold" }
    end,
    padding = { right = 1 },
})

ins_left({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 1, right = 1 }, -- We don't need space before this
})

ins_left({
    "filetype",
    icon_only = true,
    colored = true,
})

ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = "#61f25a", gui = "bold" },
    file_status = true,
    newfile_status = false,
    path = 4,
    symbols = {
        modified = "●",
        readonly = "",
        unnamed = "",
        newfile = "[New]",
    },
    padding = { right = 1 },
})

ins_left({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 1, right = 1 }, -- We don't need space before this
})

ins_left({
    "branch",
    icon = " ",
    color = { fg = "#eb7fdc", gui = "bold" },
})

ins_left({
    "diff",
    -- symbols = { added = " ", modified = "柳 ", removed = " " },
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
    function()
        return "%="
    end,
})

ins_left({
    -- Lsp server name .
    function()
        local msg = "❤"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = "",
    color = { fg = "#f2e85a", gui = "bold" },
})

ins_right({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.blue },
    },
    update_in_insert = true, -- Update diagnostics in insert mode.
    always_visible = true, -- Show diagnostics even if there are none.
})

ins_right({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 2, right = 1 }, -- We don't need space before this
})

ins_right({
    "o:encoding", -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = "bold" },
})

ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = "bold" },
})

ins_right({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 1, right = 1 }, -- We don't need space before this
})

ins_right({ "location", color = { fg = colors.red, gui = "bold" } })

ins_right({ "progress", color = { fg = colors.red, gui = "bold" } })
ins_right({
    function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }

        local progress_percent = current_line / total_lines
        local index = math.ceil(progress_percent * #chars)
        return chars[index]
    end,
    color = { fg = colors.yellow },
    padding = { left = 1 },
})
ins_right({
    function()
        return "▊"
    end,
    color = { fg = colors.blue },
    padding = { left = 2 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)

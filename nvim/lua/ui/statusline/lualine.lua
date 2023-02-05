vim.cmd [[set statusline+=%{get(b:,'gitsigns_status','')}]]
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

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " ",
    },
    colored = true,
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.blue },
        color_hint = { fg = colors.green }
    },
    always_visible = false,
    update_in_insert = true,
}

local branch = {
    "branch",
    icon = " ",
    color = { fg = "#eb7fdc" },
    -- separator = { left = "", right = "" },
    padding = { left = 2, right = 1 },
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " },
    -- separator = { left = "", right = "" },
}

local location = {
    "location",
    padding = 1,
}

local mode_custom = {
    function()
        return " SownteeNguyen"
    end,
    color = function()
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
    separator = { left = "", right = "" },
}

local custom_icons = {
    function()
        return " SownteeNguyen"
    end,
    separator = { left = "", right = "" },
}

local modes = {
    "mode",
    separator = { right = "" },
}

local indent = function()
    return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lsp_progess = function()
    msg = msg or "✖"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
            return "NO LSP"
        end
        return msg
    end
    local buf_ft = vim.bo.filetype
    local buf_client_names = {}
    local copilot_active = false
    local null_ls = require("null-ls")
    local alternative_methods = {
        null_ls.methods.DIAGNOSTICS,
        null_ls.methods.DIAGNOSTICS_ON_OPEN,
        null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }

    -- add client
    for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
            table.insert(buf_client_names, client.name)
        end

        if client.name == "copilot" then
            copilot_active = true
        end
    end

    function list_registered_providers_names(filetype)
        local s = require("null-ls.sources")
        local available_sources = s.get_available(filetype)
        local registered = {}
        for _, source in ipairs(available_sources) do
            for method in pairs(source.methods) do
                registered[method] = registered[method] or {}
                table.insert(registered[method], source.name)
            end
        end
        return registered
    end

    function list_registered(filetype)
        local registered_providers = list_registered_providers_names(filetype)
        local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
            return registered_providers[m] or {}
        end, alternative_methods))
        return providers_for_methods
    end

    function formatters_list_registered(filetype)
        local registered_providers = list_registered_providers_names(filetype)
        return registered_providers[null_ls.methods.FORMATTING] or {}
    end

    -- formatters
    local supported_formatters = formatters_list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_formatters)

    -- linters
    local supported_linters = list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_linters)
    local unique_client_names = vim.fn.uniq(buf_client_names)

    local language_servers = "" .. table.concat(unique_client_names, ", ") .. ""

    if copilot_active then
        language_servers = language_servers .. "%#SLCopilot#" .. "    "
    end

    return language_servers
end

lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", 'packer', 'NvimTree', 'toggleterm' },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {
            -- mode_custom,
            custom_icons,
            -- modes,
        },
        lualine_b = {
            {
                "filetype",
                icon_only = true,
                colored = true,
                padding = { left = 2 },
                color = { bg = colors.yellow },
            },
            {
                "filename",
                padding = 1,
                separator = { left = "", right = "" },
                color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                file_status = true,
                newfile_status = false,
                path = 4,
                symbols = {
                    modified = "●",
                    readonly = "",
                    unnamed = "",
                    newfile = "[New]",
                },
            },
        },
        lualine_c = {
            branch,
            diff,
            {
                function()
                    return " "
                end,
                separator = { left = "", right = "" },
                color = { bg = colors.blue, fg = "#000000" },
            }
        },
        lualine_x = {
            {
                function()
                    return " "
                end,
                separator = { left = "", right = "" },
                color = { bg = colors.yellow, fg = "#000000" },
            },
            diagnostics,
            {
                lsp_progess,
            },
            {
                function()
                    return " "
                end,
                separator = { left = "", right = "" },
                color = { bg = colors.blue, fg = "#000000" },
            },
            indent,
            {
                function()
                    return ""
                end,
                separator = { left = "", right = "" },
                color = { bg = colors.yellow, fg = "#000000" },
            },
            "progress",
            {
                function()
                    return ""
                end,
                separator = { left = "", right = "" },
                color = { bg = colors.blue, fg = "#000000" },
            },
            location,
            {
                function()
                    local current_line = vim.fn.line(".")
                    local total_lines = vim.fn.line("$")
                    local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
                    local progress_percent = current_line / total_lines
                    local index = math.ceil(progress_percent * #chars)
                    return chars[index]
                end,
                color = { fg = colors.yellow },
            }
        },
        lualine_y = {},
        lualine_z = {},
    },
})

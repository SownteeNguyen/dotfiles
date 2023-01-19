local installed, noice = pcall(require, "noice")

if installed then
    noice.setup({
        routes = {
            {
                view = "notify",
                filter = {
                    event = "msg_showmode",
                },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "%d+B written",
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "before #%d+",
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "fewer lines?",
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "more lines?",
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "lines? yank",
                },
                opts = { skip = true },
            },
        },
        views = {
            mini = {
                position = {
                    row = "90%",
                    col = "100%",
                },
            },
            cmdline_popup = {
                position = {
                    row = "40%",
                    col = "50%",
                },
                size = {
                    width = "40%",
                    height = "auto",
                },
            },
        },
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
            opts = { buf_options = { filetype = "vim" } },
            icons = {
                ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
                ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
                [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
            },
        },
        messages = {
            enabled = true,
            view = "notify",
            view_warn = "notify",
            view_error = "notify",
            view_history = "messages",
            view_search = "virtualtext",
        },
        lsp = {
            progress = {
                enabled = false,
                view = "mini",
            },
            signature = {
                enabled = true,
            },
            hover = {
                enabled = true,
            },
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
    })
end

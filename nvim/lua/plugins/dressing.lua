local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
    return
end

dressing.setup({
    input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left",
        insert_only = true,
        anchor = "SW",
        border = "rounded",
        relative = "cursor",
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },
        -- winblend = 10,
        -- winhighlight = "",
        override = function(conf)
            return conf
        end,
        get_config = nil,
    },
    select = {
        enabled = true,
        backend = { "builtin", "telescope", "nui" },
        trim_prompt = true,
        telescope = nil,
        nui = {
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
                style = "rounded",
            },
            buf_options = {
                swapfile = false,
                filetype = "DressingSelect",
            },
            win_options = {
                winblend = 10,
            },
            max_width = 80,
            max_height = 40,
            min_width = 40,
            min_height = 10,
        },

        builtin = {
            anchor = "NW",
            border = "rounded",
            relative = "editor",
            -- winblend = 10,
            -- winhighlight = "",
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },
            override = function(conf)
                return conf
            end,
        },
        format_item_override = {},
        get_config = nil,
    },
})

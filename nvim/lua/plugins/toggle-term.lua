local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    return
end

toggleterm.setup({
    size = 10,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    highlights = {
        -- Normal = {
        --     guibg = ""
        -- },
        -- NormalFloat = {
        --     guibg = "#18181a"
        -- },
        FloatBorder = {
            guifg = "#ff00ff",
            -- guibg = "#ff0"
        },
    },
    float_opts = {
        border = 'curved',
        winblend = 3,
    },
})

-- LazyGit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "curved",
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
})

function LazyGit()
    lazygit:toggle()
end

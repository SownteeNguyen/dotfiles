vim.cmd([[highlight GitSignsAdd guifg=#00ff00 gui=nocombine]])
vim.cmd([[highlight GitSignsChange guifg=#ff7f00 gui=nocombine]])
vim.cmd([[highlight GitSignsDelete guifg=#ff0000 gui=nocombine]])

local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
    return
end

gitsigns.setup({
    signs = {
        add          = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change       = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete       = { hl = "GitSignsDelete", text = "▍", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete    = { hl = "GitSignsDelete", text = "▍", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        untracked    = { hl = 'GitSignsAdd', text = "┆", numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 200,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = "   <author>  <author_time:%h %d, %Y> ✦  <author_time:%X>   <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
})

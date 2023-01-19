vim.cmd([[highlight IndentBlanklineIndent1 guifg=#ff0000 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#ff7f00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#ffff00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#00ff00 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#4b0082 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#8f00ff gui=nocombine]])

vim.cmd([[highlight IndentBlanklineContextStart guisp=#8f00ff gui=underline]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#8f00ff gui=nocombine]])

vim.opt.list = true
vim.opt.listchars = "lead:·,trail:·,nbsp:◇,tab:··,extends:▸,precedes:◂"

require("indent_blankline").setup({
    indentLine_enabled = 1,
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
    show_current_context = true,
    show_current_context_start = true,
    context_char = "▍",
    space_char_blankline = " ",
    enabled = true,
    use_treesitter = true,
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "neo-tree",
        "NvimTree",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "lsp-installer",
        "noice",
        "",
    },
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
        "IndentBlanklineIndent7",
    },
})

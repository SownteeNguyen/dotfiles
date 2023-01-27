-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end
require("nvim-treesitter.install").compilers = { "clang" }
treesitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
    },
    rainbow = {
        enable = true,
        extended_mode = false,
        max_file_lines = nil,
    },
    indent = { enable = true },
    autotag = { enable = true },
    autopairs = { enable = true },
    ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "cpp",
        "c",
        "lua",
        -- Support Noice
        "vim",
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
    },
    auto_install = true,
})

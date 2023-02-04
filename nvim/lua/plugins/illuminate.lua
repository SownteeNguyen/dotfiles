local status, illuminate = pcall(require, "illuminate")

if not status then
    return
end

illuminate.configure({
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NvimTree",
        "packer",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
        "aerial",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    max_file_lines = nil,
})

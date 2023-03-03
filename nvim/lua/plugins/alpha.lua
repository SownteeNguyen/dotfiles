local autocmd = vim.api.nvim_create_autocmd
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())
local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date(" %d-%m-%Y       %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "        v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return datetime .. "       " .. total_plugins .. " plugins" .. nvim_version_info
end


local logo = [[
███████╗  ██████╗  ██╗   ██╗   ██╗ ███╗   ██╗ ████████╗ ███████╗ ███████╗  ⠀⠀⠀  ███████╗  ███████╗ ██╗   ██╗
██╔════╝ ██╔═══██╗ ██║   ██║   ██║ ████═╗ ██║ ╚══██╔══╝ ██╔════╝ ██╔════╝       ██╔═══██╗ ██╔════╝ ██║   ██║
███████╗ ██║   ██║ ██║   ██║   ██║ ██╔███╗██║    ██║    █████╗   █████╗   ████╗ ██║   ██║ █████╗   ██║   ██║
╚════██║ ██║   ██║ ╚██╗ ████╗ ██╔╝ ██║╚═████║    ██║    ██╔══╝   ██╔══╝    ╚══╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝
███████║ ╚██████╔╝  ╚████╔╚████╔╝  ██║  ╚███║    ██║    ███████╗ ███████╗      ⠀███████╔╝ ███████╗  ╚████╔╝
╚══════╝  ╚═════┘    ╚═══╝ ╚═══╝   ╚═╝  ⠀ ╚═╝    ╚═╝    ╚══════╝ ╚══════╝        ╚═════╝  ╚══════╝   ╚═══╝
]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
    dashboard.button("a", " " .. "   New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("b", " " .. "   Bookmarks", ":Reach marks<CR>"),
    dashboard.button(
        "c",
        " " .. "   Find File",
        ":Telescope find_files theme=dropdown initial_mode=insert<cr>"
    ),
    dashboard.button("d", " " .. "   Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("e", " " .. "   Search Word", ":Telescope live_grep theme=dropdown<cr>"),
    dashboard.button("f", " " .. "   Select Themes", ":Telescope colorscheme<cr>"),
    dashboard.button("g", " " .. "   Media Files", ":lua require('telescope').extensions.media_files.media_files()<cr>"),
    dashboard.button(
        "h",
        " " .. "   Lazygit",
        ":lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit', direction = 'float'}):toggle()<cr>"
    ),
    dashboard.button("i", " " .. "   Mason", ":Mason<CR>"),
    dashboard.button("q", " " .. "   Quit", ":qa<CR>"),
    -- dashboard.button(
    --     "n",
    --     " " .. "   File Manager",
    --     ":lua require('toggleterm.terminal').Terminal:new({cmd = 'joshuto', direction = 'float'}):toggle()<cr>"
    -- ),
    -- dashboard.button(
    --     "t",
    --     " " .. "   TODO",
    --     ":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<CR>"
    -- ),
}
for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
vim.b.miniindentscope_disable = true

alpha.setup({
    layout = {
        { type = "padding", val = 1 },
        dashboard.section.header,
        { type = "padding", val = 1 },
        -- { type = "group",   val =  },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
    },
    -- opts = { margin = 5 },
})

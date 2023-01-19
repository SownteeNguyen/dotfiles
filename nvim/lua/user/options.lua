local autocmd = vim.api.nvim_create_autocmd

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

local options = {
    -- NUMBER
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    ruler = true,
    numberwidth = 5, -- set number column width to 2 {default 4}

    -- INDENT
    expandtab = true, -- convert tabs to spaces
    smarttab = true,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    softtabstop = 4,
    smartindent = true, -- make indenting smarter again
    autoindent = true,
    cindent = true,
    smartcase = true, -- smart case
    ignorecase = true, -- ignore case in search patterns

    fileencoding = "utf-8", -- the encoding written to a file
    encoding = "utf-8",
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- denied neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    swapfile = false, -- creates a swapfile
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    undofile = true, -- enable persistent undo

    mouse = "a", -- allow the mouse to be used in neovim
    cursorline = true, -- highlight the current line
    title = true,

    conceallevel = 0, -- so that `` is visible in markdown files
    hlsearch = true, -- highlight all matches on previous search pattern
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 1, -- always show tabs
    laststatus = 3,

    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 0, -- faster completion (4000ms default)
    showcmd = false,
    wrap = true, -- display lines as one long line
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    backspace = "indent,eol,start",
}

-- Dont show start neovim
vim.opt.shortmess:append("sI")

-- For Copilot
vim.g.copilot_no_tab_map = true

-- For Number
autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })

-- For NeoVide
vim.cmd [[set guifont=Iosevka\ Nerd\ Font\ Mono:h10.5]]
vim.cmd [[let g:neovide_scale_factor = 1]]
vim.cmd [[let g:neovide_transparency = 1]]
vim.cmd [[let g:neovide_scroll_animation_length = 0.3]]
vim.cmd [[let g:neovide_refresh_rate = 60]]
vim.cmd [[let g:neovide_cursor_antialiasing = v:true]]

for k, v in pairs(options) do
    vim.opt[k] = v
end

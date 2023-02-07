local client_id = {
    default = "793271441293967371",
    vs_code = "383226320970055681",
    coc_nvim = "768090036633206815",
}

local log_levels = {
    none = nil,
    error = "error",
    warn = "warn",
    info = "info",
    debug = "debug",
}

require("presence"):setup({
    auto_update = true,
    neovim_image_text = "The Text Editor, Code From @SownteeNguyen",
    main_image = "file",
    client_id = client_id.default,
    log_level = log_levels.none,
    debounce_timeout = 10,
    enable_line_number = false,
    blacklist = {},
    buttons = true,
    file_assets = {},

    -- Rich Presence text options
    editing_text = "Editing : %s",
    file_explorer_text = "Browsing %s",
    git_commit_text = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text = "Reading : %s",
    workspace_text = "Workspaces : %s",
    line_number_text = "Line %s out of %s",
    -- buttons = {
    --     { label = "View All Repositories", url = "https://github.com/SownteeNguyen" },
    -- },
})

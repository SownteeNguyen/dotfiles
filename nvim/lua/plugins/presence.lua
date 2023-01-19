require("presence"):setup({
    -- General options
    auto_update = true,
    neovim_image_text = "The Text Editor, Code From @SownteeNguyen",
    main_image = "neovim",
    client_id = "793271441293967371",
    log_level = nil,
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

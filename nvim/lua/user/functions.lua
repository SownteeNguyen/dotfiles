local M = {}
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd
---Highlight yanked text
--
au("TextYankPost", {
    group = ag("yank_highlight", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
})

vim.api.nvim_create_autocmd("ColorSchemePre", {
    pattern = "*",
    callback = function()
        print "I ran before loading Catppuccin!"
    end
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local colors = require("catppuccin.palettes").get_palette()
        -- do something with colors
    end
})

vim.cmd([[
  function Test()
    %SnipRun
    call feedkeys("\<esc>`.")
  endfunction

  function TestI()
    let b:caret = winsaveview()    
    %SnipRun
    call winrestview(b:caret)
  endfunction
]])

function M.sniprun_enable()
    vim.cmd([[
    %SnipRun

    augroup _sniprun
     autocmd!
     autocmd TextChanged * call Test()
     autocmd TextChangedI * call TestI()
    augroup end
  ]] )
    vim.notify("Enabled SnipRun")
end

function M.disable_sniprun()
    M.remove_augroup("_sniprun")
    vim.cmd([[
    SnipClose
    SnipTerminate
    ]])
    vim.notify("Disabled SnipRun")
end

function M.toggle_sniprun()
    if vim.fn.exists("#_sniprun#TextChanged") == 0 then
        M.sniprun_enable()
    else
        M.disable_sniprun()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

vim.cmd([[ command! SnipRunToggle execute 'lua require("user.functions").toggle_sniprun()' ]])

-- get length of current word
function M.get_word_length()
    local word = vim.fn.expand("<cword>")
    return #word
end

function M.toggle_option(option)
    local value = not vim.api.nvim_get_option_value(option, {})
    vim.opt[option] = value
    vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
    local value = vim.api.nvim_get_option_value("showtabline", {})

    if value == 2 then
        value = 0
    else
        value = 2
    end

    vim.opt.showtabline = value

    vim.notify("showtabline" .. " set to " .. tostring(value))
end

function M.isempty(s)
    return s == nil or s == ""
end

function M.get_buf_option(opt)
    local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
    if not status_ok then
        return nil
    else
        return buf_option
    end
end

M.show_documentation = function()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ "vim", "help" }, filetype) then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    elseif vim.tbl_contains({ "man" }, filetype) then
        vim.cmd("Man " .. vim.fn.expand("<cword>"))
    elseif vim.fn.expand("%:t") == "Cargo.toml" then
        require("crates").show_popup()
    else
        vim.lsp.buf.hover()
    end
end

return M

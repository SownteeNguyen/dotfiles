local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
    return
end

local actions = require('telescope.actions')
telescope.load_extension("media")
telescope.setup {
    defaults = {
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.9,
            preview_cutoff = 120,
        },
        find_command = {
            'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        file_ignore_patterns = {
            ".git/",
        },
        file_sorter = require 'telescope.sorters'.get_fuzzy_file,
        generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = { "smart" },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            }
        }
    },
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf", "mp4" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },

        media = {
            backend = "ueberzug",
            cache_path = "/tmp/tele.media.cache",
            hidden = false,
        }
    }
}

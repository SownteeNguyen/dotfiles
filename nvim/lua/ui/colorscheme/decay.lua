-- local style = 'decayce' -- or another style of course
-- local colors = require('decay.core').get_colors(style)
--
-- local present, decay = pcall(require, 'decay')
--
-- if not present then
--     return
-- end
--
-- decay.setup({
--     style = 'dark', -- 'decayce' 'dark'
--     italics = {
--         code = true,
--         comments = false -- to disable italic comments, replace to true to enable
--     },
--     nvim_tree = {
--         contrast = true
--     },
--     cmp = {
--         block_kind = true,
--     },
--     override = {
--         -- override property colors using treesitters highlights
--         ["@property"] = { fg = colors.red },
--     }
-- })
-- vim.cmd("colorscheme decay")

-- -- Set PowerShell
-- local powershell_options = {
-- 	-- shell = vim.fn.executable("pwsh") and "pwsh" or "powershell",
-- 	shell = vim.fn.executable("powershell") and "powershell",
-- 	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
-- 	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
-- 	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
-- 	shellquote = "",
-- 	shellxquote = "",
-- }
--
-- for option, value in pairs(powershell_options) do
-- 	vim.opt[option] = value
-- end
--
-- Setup
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 10,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 5,
		highlights = {
			border = "#ff00ff",
			background = "Normal",
		},
	},
})

-- LazyGit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

function LazyGit()
	lazygit:toggle()
end

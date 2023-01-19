local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local config = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"eslint-lsp",
		"prettier",
		"deno",
		"emmet-ls",
		"json-lsp",

		-- c++
		"clangd",
		"clang-format",
	},
	-- virtual_text = false,
	-- update_in_insert = true,
	-- underline = true,
	-- severity_sort = true,
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		width = 40,
	},
}

vim.diagnostic.config(config)
mason.setup()

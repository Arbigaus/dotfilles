vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".git" },
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
}

vim.lsp.config("sourcekit", {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
})

vim.lsp.config["openscad_ls"] = {
	cmd = { vim.fn.expand("~/.cargo/bin/openscad-language-server") },
	filetypes = { "openscad" },
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
	end,
}

vim.lsp.enable({ "eslint", "sourcekit", "ts_ls" })

if vim.fn.executable("lua-language-server") == 1 then
	vim.lsp.enable("lua_ls")
end

if vim.fn.executable(vim.fn.expand("~/.cargo/bin/openscad-language-server")) == 1 then
	vim.lsp.enable("openscad_ls")
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client or not client:supports_method("textDocument/completion") then
			return
		end

		-- The built-in LSP completion only auto-triggers on server-defined
		-- punctuation by default. Add printable ASCII so it also suggests while typing.
		local chars = {}
		for code = 32, 126 do
			table.insert(chars, string.char(code))
		end
		client.server_capabilities.completionProvider.triggerCharacters = chars

		vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
	end,
})

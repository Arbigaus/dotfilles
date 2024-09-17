return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspConfig = require("lspconfig")

			lspConfig.sourcekit.setup({
				capabilities = capabilities,
			})
			lspConfig.dartls.setup({
				capabilities = capabilities,
			})
			lspConfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspConfig.lua_ls.setup({
				capabilities = capabilities,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "require" },
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

-- Keymap file --
-- Reload neovim to read files --
vim.keymap.set("n", "<Leader><Leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<Leader>x", ":.lua<CR>")
vim.keymap.set("v", "<Leader>x", ":lua<CR>")

-- Open Parent directory --
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Cursor navigation --
vim.keymap.set("n", "<S-h>", "^")
vim.keymap.set("n", "<S-l>", "$")

-- Codes actions --
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
vim.keymap.set("n", "grr", vim.lsp.buf.references)
vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

-- Show errors or warnings --
vim.keymap.set("n", "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Window navigation
vim.keymap.set("n", "<leader><leader>h", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader><leader>j", "<C-w>j", { desc = "Go to bottom window" })
vim.keymap.set("n", "<leader><leader>k", "<C-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<leader><leader>l", "<C-w>l", { desc = "Go to right window" })

-- Create splits
vim.keymap.set("n", "<Leader><Leader>v", "<C-w>v", { desc = "Create vertical split" })
vim.keymap.set("n", "<Leader><Leader>s", "<C-w>s", { desc = "Create horizontal split" })

-- Close windows
vim.keymap.set("n", "<leader><leader>q", "<C-w>q", { desc = "Close current window" })
vim.keymap.set("n", "<leader><leader>o", "<C-w>o", { desc = "Close other windows" })

-- Window sizing
vim.keymap.set("n", "<leader><leader>=", "<C-w>=", { desc = "Equalize window sizes" })

vim.keymap.set("n", "<leader><leader><Left>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader><leader><Right>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader><leader><Up>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<leader><leader><Down>", "<C-w>-", { desc = "Decrease window height" })

-- Window management
vim.keymap.set("n", "<leader><leader>r", "<C-w>r", { desc = "Rotate windows" })
vim.keymap.set("n", "<leader><leader>t", "<C-w>T", { desc = "Move window to new tab" })

-- Autocomplete Tab --
vim.keymap.set("i", "<C-Space>", function()
	vim.lsp.completion.get()
end, { desc = "Request LSP completion" })

vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end
	return "<Tab>"
end, { expr = true })

vim.keymap.set("i", "<S-Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	end
	return "<S-Tab>"
end, { expr = true })

-- Fzf Lua keymaps --
vim.keymap.set("n", "<Leader>ff", ":FzfLua files<CR>", { desc = "Fzf Files" })

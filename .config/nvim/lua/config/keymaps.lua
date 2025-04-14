-- Keymap file --
-- Reload neovim to read files --
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<Leader>x", ":.lua<CR>")
vim.keymap.set("v", "<Leader>x", ":lua<CR>")

-- Codes actions --
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'grd', vim.lsp.buf.declaration)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)

-- Show errors or warnings --
vim.keymap.set('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- Open Parent directory --
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Navigate between buffers files --
vim.keymap.set("n", '<Tab>', ':bnext<CR>')
vim.keymap.set("n", '<S-Tab>', ':bprevious<CR>')

-- Telescope --
vim.keymap.set("n", "<Leader>fd", require('telescope.builtin').find_files)
vim.keymap.set("n", "<Leader>fh", require('telescope.builtin').help_tags)
vim.keymap.set("n", "<Leader>en", function()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath("config")
  }
end)
vim.keymap.set("n", "<space>ep", function()
  require('telescope.builtin').find_files {
    cwd = vim.fs.joinpath(tostring(vim.fn.stdpath("data")), "lazy")
  }
end)

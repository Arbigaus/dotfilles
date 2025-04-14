-- Auto cmd file --

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Attach navic to any LSP client that supports document symbols
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local navic = require("nvim-navic")
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, args.buf)

      -- Show file name + breadcrumbs in the winbar
      vim.api.nvim_set_option_value(
        "winbar",
        "%t %{%v:lua.require'nvim-navic'.get_location()%}",
        { scope = "local", win = 0 }
      )
    end
  end,
})

-- Format file on save
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client.supports_method(client, 'textDocument/formatting', args.buf) then
      -- Format the current buffer on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    local filepath = vim.api.nvim_buf_get_name(0)
    vim.fn.jobstart({ "bun", "x", "prettier", "--write", filepath }, {
      stdout_buffered = true,
      on_exit = function()
        vim.cmd("edit!") -- reload file after formatting
      end,
    })
  end,
})

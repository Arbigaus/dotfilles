return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require("telescope").setup {
      pickers = {
        find_files = {
          theme = "ivy",
          hidden = true
        }
      },
      extensions = {
        fzf = {}
      },
      defaults = {
        file_ignore_patterns = { "node_modules" }
      }
    }

    require('telescope').load_extension('fzf')
  end
}

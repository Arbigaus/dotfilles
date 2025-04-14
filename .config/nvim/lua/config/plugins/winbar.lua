return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    separator = " → ", -- Customize your breadcrumb separator here
    highlight = true,
    depth_limit = 0,
    depth_limit_indicator = "..",
  },
  config = function(_, opts)
    local navic = require("nvim-navic")
    navic.setup(opts)
  end,
}

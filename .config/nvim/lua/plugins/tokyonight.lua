return {
  "folke/tokyonight.nvim",
  lazy = false,
  name = "tokyonight-night",
  priority = 1000,
  options = {
    transparent = true,
  },
  config = function()
    require("tokyonight").setup({
      transparent = true,
    })
      vim.cmd.colorscheme("tokyonight-night")
  end,
}

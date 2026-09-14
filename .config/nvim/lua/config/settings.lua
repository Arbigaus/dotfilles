-- MAPLEADER --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.scrolloff = 6

vim.o.completeopt = "menuone,noselect,popup"

vim.o.background = "dark"

vim.filetype.add({
	extension = {
		scad = "openscad",
	},
})

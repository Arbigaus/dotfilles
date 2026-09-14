vim.b.ale_c_clangformat_executable = "/opt/homebrew/Cellar/clang-format"
vim.b.ale_c_clangformat_style_option = [[{
  IndentWidth: 4,
}]]
vim.b.ale_fixers = { "clang-format", unpack(vim.g.ale_fixers or {}) }

local function open_in_openscad()
	vim.cmd("w")
	local current_file = vim.fn.expand("%:p")
	local bin = "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
	local pid = vim.trim(vim.fn.system("pgrep -x OpenSCAD"))

	if pid == "" or vim.g.openscad_current_file ~= current_file then
		vim.fn.jobstart({ bin, current_file })
		vim.g.openscad_current_file = current_file
	end
	-- Se o arquivo é o mesmo, OpenSCAD recarrega automaticamente via :w
end

vim.keymap.set("n", "<F10>", open_in_openscad, { buffer = true, noremap = true, silent = true })

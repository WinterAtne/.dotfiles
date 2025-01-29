local options = {
	noexpandtab = no,				--DONT YOU DARE USE SPACES!
	autoindent = true,			--Does auto indenting
	clipboard = "unnamedplus",	--Use '+' register for yanks
	cpoptions = I,					--Makes it so that moving doesn't delete tabs
	cmdheight = 2,					--Set height of bottom command window
	cursorline = true,			--Highlight current line
	fileencoding = "utf-8",		--Use utf for file encoding
	guifont = "Hack Nerd Font Mono",
	ignorecase = true,			--Ignore case when searching
	infercase = true,				--Infer case when typing
	ruler = true,					--Shows collumn and line number
	relativenumber = true,		--Show relative number if number==true
	number = true,					--Show numbered lines
	signcolumn = yes,
	shiftwidth = 3,				--Sets tab spacing
	smartindent = true,			--Sets smart indenting
	smartcase = true,				--Ingore case when searching
	splitbelow = true,			--Force horizontol windows to go below current window
	splitright = false,			--Force veriticle windows to go right of current window
	showtabline = 2,				--Always show tabs
	tabstop = 4,					--Sizeof tabs
	termguicolors = true,		--Use gui colors in terminal
	undofile = true,				--Undo across sessions for file
	undolevels = 1000,			--The number of undos that are stored
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


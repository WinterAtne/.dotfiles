return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = {
				enable = true,
			},

			ensure_installed = {
				"lua",
				"c",
				"cpp",
				"c_sharp",
				"gdscript",
				"gdshader",
				"hlsl",
				"gitignore",
			}

		})
	end,
}

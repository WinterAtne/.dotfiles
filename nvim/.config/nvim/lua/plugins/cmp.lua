return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	opts = {
		sources = {
			{ name = "LuaSnip" },
			{ name = "nvim-lsp" },
			{ name = "buffer" },
			{ name = "path" },
		}
	}
}

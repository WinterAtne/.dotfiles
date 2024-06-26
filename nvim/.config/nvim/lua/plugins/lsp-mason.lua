return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				}
			}
		}
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers {
			function (server_name)
				require("lspconfig")[server_name].setup {}
			end,

		}
	end,
}


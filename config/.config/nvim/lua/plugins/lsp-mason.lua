return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		-- require("mason-lspconfig").setup_handlers ({
		-- 	function (server_name)
		-- 		require("lspconfig")[server_name].setup {}
		-- 	end,
		-- })

		vim.diagnostic.config({
			virtual_text = true
		})

		--Gets rid of that stupid annoying "uNdEfInEd gLoBaL vim" warning
		require("lspconfig").lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		}
	end,
}

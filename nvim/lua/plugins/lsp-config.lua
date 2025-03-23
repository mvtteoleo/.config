	return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
		{		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({ ensure_installed = { "lua_ls",  "fortls", "autotools_ls", "clangd", "foam_ls", "pyright", "harper_ls", }
			})
		end
	},

	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			--lspconfig.textlsp.setup({})
			lspconfig.fortls.setup({})
			lspconfig.autotools_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.foam_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.mojo.setup({})
	--		lspconfig.harper_ls.setup({})
	--		lspconfig.harper_ls.setup {
	--			settings = {
	--				["harper-ls"] = {
	--					userDictPath = "~/dict.txt"
	--				}
	--			},
	--		 }

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
		end
	},
	}

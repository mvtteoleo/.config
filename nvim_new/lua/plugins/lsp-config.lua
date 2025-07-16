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
            require("mason-lspconfig").setup({ ensure_installed = { "lua_ls",  "fortls", "autotools_ls", "clangd", "foam_ls", "pyright", "textlsp", "texlab" }
            })
        end
    },

    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})

            lspconfig.textlsp.setup({})
            lspconfig.texlab.setup({})

            lspconfig.fortls.setup({})

            lspconfig.autotools_ls.setup({})
            lspconfig.clangd.setup({
                init_options = {
                    fallbackFlags = {'--std=c++23'}
                },
            })
            lspconfig.foam_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.mojo.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            -- Definition in a new split window
            vim.keymap.set('n', 'gd', ":vsplit | lua vim.lsp.buf.definition()<CR>", { noremap=true, silent=true})
            -- Definition in place
            vim.keymap.set('n', 'gh', vim.lsp.buf.definition, {})
        end
    },
}

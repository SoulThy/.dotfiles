return{
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jedi_language_server","clangd"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({}) -- lua LSP
            lspconfig.jedi_language_server.setup({}) -- Python LSP
            lspconfig.clangd.setup({}) -- C LSP
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set({'n'},'<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}



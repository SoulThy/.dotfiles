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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local function setup_lsp(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,  -- Use the capabilities for nvim-cmp
                })
            end

            setup_lsp("lua_ls") -- Lua LSP
            setup_lsp("jedi_language_server") -- Python LSP
            setup_lsp("clangd") -- C/C++ LSP

            vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
            vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next, { desc = 'Next diagnostic' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Show code actions' })
        end
    }
}



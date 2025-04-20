return {
    {
        "hrsh7th/nvim-cmp", -- Main completion plugin
        event = "InsertEnter", -- Load when entering insert mode (lazy loads for speed)
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Enables LSP-based completion
            "hrsh7th/cmp-buffer", -- Enables completion from the current buffer
            "hrsh7th/cmp-path", -- Enables path completion (useful for editing paths)
        },
        config = function()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require("cmp")
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(), -- Select next completion item
                    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select previous completion item
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
                    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
                    ["<C-e>"] = cmp.mapping.abort(), -- Close completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept completion (auto-select first item)
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Enable LSP-based completion
                },
                {
                    { name = "buffer" }, -- Enable buffer-based completion
                })
            })
        end
    }
}


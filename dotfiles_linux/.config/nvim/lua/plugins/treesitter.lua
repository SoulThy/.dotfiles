local ensure_installed = {
    "vimdoc",
    "c",
    "python",
    "markdown",
    "lua",
    "vim",
    "query",
    "html",
    "diff",
    "bash",
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = ensure_installed,
            auto_install = true, -- Auto-install missing parsers
            highlight = {
                enable = true, -- Enable Treesitter syntax highlighting
            },
            indent = {
                enable = true, -- Enable Treesitter-based indentation
            },
            modules = {},
            sync_install = false, -- Install parsers asynchronously
            ignore_install = { "verilog" }, -- Removed verilog, it is slow to open

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Auto-jump to the best match
                    keymaps = {
                        ["af"] = "@function.outer", -- Select whole function
                        ["if"] = "@function.inner", -- Select inside function
                    },
                },
            },
        })
    end
}

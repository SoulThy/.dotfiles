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
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            modules = {},
            sync_install = false,
            ignore_install = {},
        })
    end
}

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "go",
        "hcl",
        "lua",
        "python",
        "typescript",
        "vimdoc",
    },
    highlight = { enable = true },
    indent = { enable = true }
})

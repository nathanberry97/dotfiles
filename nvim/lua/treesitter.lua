require("nvim-treesitter.configs").setup({
    -- LuaFormatter off
    ensure_installed = {
        "bash",
        "go",
        "hcl",
        "lua",
        "python",
        "typescript",
        "vimdoc",
    },
    -- LuaFormatter on
    highlight = {enable = true},
    indent = {enable = true}
})

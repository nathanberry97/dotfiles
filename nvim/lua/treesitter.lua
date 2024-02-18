require("nvim-treesitter.configs").setup({
    -- LuaFormatter off
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "hcl",
        "html",
        "json",
        "lua",
        "python",
        "typescript",
        "vimdoc",
        "yaml",
    },
    -- LuaFormatter on
    highlight = {enable = true},
    indent = {enable = true}
})

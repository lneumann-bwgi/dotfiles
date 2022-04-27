require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.clang_format,
        require("null-ls").builtins.formatting.eslint_d,
        require("null-ls").builtins.formatting.fixjson,
        require("null-ls").builtins.formatting.gofmt,
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.lua_format,
        require("null-ls").builtins.formatting.shfmt,
    },
})

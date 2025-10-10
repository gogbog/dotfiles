return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
        local mason_null_ls = require("mason-null-ls")
        mason_null_ls.setup({
            ensure_installed = { "gomodifytags", "impl", "gofumpt", "goimports" },
        })

        local nls = require("null-ls")

        nls.setup({
            sources = {
                -- Code actions
                nls.builtins.code_actions.gomodifytags,
                nls.builtins.code_actions.impl,
                -- Formatters
                nls.builtins.formatting.goimports,  -- removes unused imports
                nls.builtins.formatting.gofumpt,    -- formats code
            },
        })
    end,
}

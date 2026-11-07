-- Run these mappings whenever an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        -- Go to definition
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        -- Go to declaration
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        -- Find references
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- Hover documentation
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- Rename symbol
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- Code actions
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Format current buffer
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        -- Diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        -- Show diagnostic message
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    end,
})

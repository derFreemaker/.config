local setup, lspconfig, cmp_nvim_lsp = protectedRequire("lspconfig", "cmp_nvim_lsp")
if not setup then
    return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)                     -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)          -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)                -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)       -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)            -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                 -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)           -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)           -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                       -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)                 -- see outline on right hand side
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure emmet language server
lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                maxPreload = 1000000,
                preloadFileSize = 1000,
                -- make language server aware of runtime files
                library = {
                    vim.env.VIMRUNTIME
                },
            },
        }
    }
})

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["marksman"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["yamlls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["biome"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

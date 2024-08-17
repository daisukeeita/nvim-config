local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr })
    end
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false },
      diagnostics = { globals = { "vim" } },
      completion = {
        callSnippet = "Both",
        keywordSnippet = "Both",
        workspaceWord = true,
      },
      hint = {
        enable = true,
        paramType = false,
        semicolon = false,
        setType = true,
        arrayIndex = false,
      },
    },
  },
})

-------------------------------------------------
-----------       ESLINT SETUP        -----------
-------------------------------------------------
require("lspconfig").eslint.setup({
  capabilities = capabilities,
  settings = {
    packageManager = "npm",
  },
})

-------------------------------------------------
-----------       TSSERVER SETUP      -----------
-------------------------------------------------
require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr })
    end
  end,
  single_file_support = false,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "literal",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
  init_options = {
    hostInfo = "neovim",
  },
})

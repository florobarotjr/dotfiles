return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "gopls",
        "golangci_lint_ls",
        "graphql",
        "helm_ls",
        "html",
        "lua_ls",
        "prismals",
        "pyright",
        "svelte",
        "tailwindcss",
        "tsserver",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "black", -- python formatter
        "eslint_d",
        "golangci-lint",
        "gofumpt",
        "isort", -- python formatter
        "prettier", -- prettier formatter
        "pylint",
        "stylua", -- lua formatter
      },
    })
  end,
}

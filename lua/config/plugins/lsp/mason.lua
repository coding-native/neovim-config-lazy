return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "cssls",
        "csharp_ls",
        "dockerls",
        "eslint",
        "glsl_analyzer",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "templ",
        "ts_ls",
        "vimls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}

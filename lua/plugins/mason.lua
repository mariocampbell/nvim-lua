return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "html",
        "cssls",
        "tsserver",
        "lua_ls",
        "ember",
        "emmet_language_server",
        "gopls",
        "astro",
      },
      automatic_installation = true,
    })
  end
}

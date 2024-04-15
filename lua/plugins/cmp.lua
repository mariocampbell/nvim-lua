return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  event = "VeryLazy",
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {},
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "gopls" },
        { name = "luasnip" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "git" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig")["pyright"].setup({
      capabilities = capabilities,
    })

    require("lspconfig")["tsserver"].setup({
      capabilities = capabilities,
    })

    require("lspconfig")["html"].setup({
      capabilities = capabilities,
    })

    require("lspconfig")["ember"].setup({
      capabilities = capabilities,
    })

    require("lspconfig")["lua_ls"].setup({
      capabilities = capabilities,
    })

    require("lspconfig")["gopls"].setup({
      capabilities = capabilities,
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
    })

    require("lspconfig")["astro"].setup({
      capabilities = capabilities,
    })

    require("lspconfig")["emmet_language_server"].setup({
      capabilities = capabilities,
      filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "handlers",
        "typescriptreact",
      },
    })
  end,
}

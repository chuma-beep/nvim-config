return {
  -- Extend LazyVim LSP setup
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      -- servers you want to auto-configure
      servers = {
        tsserver = {},
        pyright = {},
        gopls = {},
        html = {},
        cssls = {},
        marksman = {},
        -- Add any other LSPs you installed via :Mason
      },
    },
  },
}

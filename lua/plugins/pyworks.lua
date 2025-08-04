return {
  {
    "jeryldev/pyworks.nvim",
    lazy = false,
    dependencies = {
      {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
      },
      "3rd/image.nvim",
      "GCBallesteros/jupytext.nvim",
    },
    config = function()
      require("pyworks").setup({
        python = {
          preferred_venv_name = ".venv",
          use_uv = vim.fn.executable("uv") == 1,
        },
        auto_activate_venv = true,
        ui = {
          icons = {
            python = "🐍",
            success = "✓",
            error = "✗",
            warning = "⚠️",
          },
        },
      })
      --    vim.keymap.set("n", "<Leader>pt", "<cmd>term python %<CR>", { desc = "Run Python file in terminal" })
      --  vim.keymap.set("n", "<Leader>ps", ":PyworksSetup<CR>", { desc = "Pyworks setup" })
      --  vim.keymap.set("n", "<Leader>pr", ":MoltenEvaluate<CR>", { desc = "Run Jupyter cell" })
    end,
  },
}

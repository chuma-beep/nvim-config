return {
  {
    "jeryldev/pyworks.nvim",
    dependencies = {
      {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
      },
      "3rd/image.nvim",
      "GCBallesteros/jupytext.nvim",
    },
    lazy = false,
    config = function()
      require("pyworks").setup({
        python = {
          preferred_venv_name = ".venv",
          use_uv = true,
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
    end,
  },
}

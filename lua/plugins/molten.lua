return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  ft = { "python", "json" },
  dependencies = {
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",
        max_width = 100,
        max_height = 12,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs" },
      },
    },
  },
  build = ":UpdateRemotePlugins",
  init = function()
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = true
    vim.g.molten_jupyter_command = "/home/devWisdom/miniforge3/envs/base/bin/jupyter"
    vim.g.molten_virt_env = "/home/devWisdom/miniforge3/envs/base/bin/python"
  end,
}

-- ~/.config/nvim/lua/plugins/neopyter.lua

-- Specify the path to your virtual environment's python executable
-- This line needs to be set *before* lazy.nvim attempts to load Python plugins
-- A good place for this is often in a separate 'options' or 'globals' file,
-- or directly in init.lua if it's a critical global setting.
-- For this example, let's keep it here for now, but be aware of load order.
--vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim_py_plugins/bin/python")

return {
  "SUSTech-data/neopyter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter", -- neopyter doesn't depend on nvim-treesitter, but does depend on treesitter parser of python
    "AbaoFromCUG/websocket.nvim", -- optional for mode="direct"
  },
  opts = {
    mode = "direct", -- or "proxy" depending on your setup
    remote_address = "127.0.1.1:9001", -- adjust IP and Port as needed
  },
  config = function(opts)
    require("neopyter").setup(opts)
    -- Example keymap to run a cell (adjust as desired)
    vim.keymap.set(
      "n",
      "<C-Enter>",
      "<cmd>Neopyter execute notebook:run-cell<cr>",
      { desc = "Run selected Neopyter cell" }
    )
  end,
}

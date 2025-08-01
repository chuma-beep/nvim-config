-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "java" }, -- Add languages you need
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

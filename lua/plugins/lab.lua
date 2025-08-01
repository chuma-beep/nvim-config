return {
  "0x100101/lab.nvim",
  build = "cd js && npm install",
  ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  config = function()
    require("lab").setup({
      code_runner = { enabled = true, virtual_text = true },
      quick_data = { enabled = false },
    })
    -- Auto-start runner for JS/TS/JSX/TSX files

    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
      callback = function()
        vim.defer_fn(function()
          vim.cmd("Lab code run")
        end, 100)
      end,
    })
  end,
  keys = {
    { "<leader>rr", ":Lab code run<CR>", desc = "Run Code" },
    { "<leader>rs", ":Lab code stop<CR>", desc = "Stop Code" },
  },
}

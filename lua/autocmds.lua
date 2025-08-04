-- Auto-import output chunks from a jupyter notebook
vim.api.nvim_create_autocmd("BufAdd", {
  pattern = { "*.ipynb" },
  callback = imb,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.ipynb" },
  callback = function(e)
    if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
      imb(e)
    end
  end,
})

-- Auto-export output chunks to a jupyter notebook on write
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.ipynb" },
  callback = function()
    if require("molten.status").initialized() == "Molten" then
      vim.cmd("MoltenExportOutput!")
    end
  end,
})

-- Change Molten settings based on filetype
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function(e)
    -- ... python file molten config change logic ...
  end,
})

-- ADDED: Autocommand to run the Python file on save.
-- This replaces the original PyworksRun command with the correct MoltenEvaluate command.
local autocmd_group = vim.api.nvim_create_augroup("PyworksAutoRun", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = autocmd_group,
  pattern = "*.py",
  callback = function()
    vim.cmd("MoltenEvaluate")
  end,
  desc = "Automatically run the Python file after saving.",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.qmd", "*.md", "*.ipynb" },
  callback = function(e)
    -- ... notebook file molten config change logic ...
  end,
})

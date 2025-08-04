--General Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- C/C++ Compile and Run
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w") -- Save the file
  local file = vim.fn.expand("%") -- Get the current file name
  local out = vim.fn.expand("%:r") -- Get the file name without the extension
  vim.cmd("!gcc " .. file .. " -o " .. out .. " && ./" .. out) -- Compile and run
end, { desc = "Compile and run C file" })

-- Telescope (ensure you have this plugin installed)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files", silent = true })

-- Molten Keymaps (ensure you have this plugin installed)
-- Using <localleader> to avoid conflicts with global keymaps
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize Molten" })

-- Custom Molten initialization for virtual environments
vim.keymap.set("n", "<localleader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    -- Extract the environment name from the path
    venv = string.match(venv, "/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })

-- Molten execution commands
vim.keymap.set("n", "<localleader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
vim.keymap.set("n", "<localleader>mc", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { silent = true, desc = "Delete Molten cell" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "Hide output" })
vim.keymap.set(
  "n",
  "<localleader>os",
  ":noautocmd MoltenEnterOutput<CR>",
  { silent = true, desc = "Show/enter output" }
)
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "Run operator selection" })

-- Molten visual mode keymaps
vim.keymap.set(
  "v",
  "<localleader>m",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "Evaluate visual selection" }
)

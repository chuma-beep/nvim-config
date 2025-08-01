-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w") -- Save the file
  local file = vim.fn.expand("%") -- Get the current file name
  local out = vim.fn.expand("%:r") -- Get the file name without the extension
  vim.cmd("!gcc " .. file .. " -o " .. out .. " && ./" .. out) -- Compile and run
end, { desc = "Compile and run C file" })

-- lua/keymaps.lua
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
-- Add other non-plugin-specific keymaps here

-- Example:
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>cr", ":Lab code run<CR>", { desc = "Run Code (lab.nvim)" })
vim.keymap.set("n", "<leader>cs", ":Lab code stop<CR>", { desc = "Stop Code (lab.nvim)" })
vim.keymap.set("n", "<leader>cp", ":Lab code panel<CR>", { desc = "Open Code Panel (lab.nvim)" })

-- core/keymaps.lua
local map = vim.api.nvim_set_keymap
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
-- define more shortcuts here

-- jupyter keymaps
vim.keymap.set("n", "<leader>ja", "<cmd>JupyterAddCellBelow<CR>")
vim.keymap.set("n", "<leader>jm", "<cmd>JupyterMergeCellAbove<CR>")
vim.keymap.set("n", "<leader>jt", "<cmd>JupyterConvertCellType<CR>")

--molten keymaps
vim.keymap.set("n", "<localleader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
    venv = string.match(venv, "/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })

--minimum suggestes keymaps for molten
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<localleader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>mc", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set(
  "v",
  "<localleader>r",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "evaluate visual selection" }
)

--other example keymaps
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
vim.keymap.set(
  "n",
  "<localleader>os",
  ":noautocmd MoltenEnterOutput<CR>",
  { silent = true, desc = "show/enter output" }
)

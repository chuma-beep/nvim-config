-- return {
--   "benlubas/molten-nvim",
--   version = "^1.0.0",
--   ft = { "python", "json" },
--   dependencies = {
--     -- Declare the dependency, but configure it elsewhere
--     "3rd/image.nvim",
--   },
--   build = ":UpdateRemotePlugins",
--   init = function()
--     -- Configuration for inline images
--     vim.g.molten_auto_open_output = true -- Enable auto-opening output for images
--     vim.g.molten_virt_lines_output = true -- Enable virtual lines for output
--     vim.g.molten_image_provider = "image.nvim"
--     -- vim.g.molten_wrap_output = true
--     vim.g.molten_virt_text_output = true
--
--     -- Image display settings
--     --  vim.g.molten_output_show_more = false
--     vim.g.molten_output_win_max_height = 20
--     --  vim.g.molten_output_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
--     -- vim.g.molten_output_border = "single"
--
--     vim.g.molten_output_win_border = "none"
--     -- vim.g.molten_output_border = "single"
--     -- vim.g.molten_auto_open_output = true
--     vim.g.molten_use_floating_win = false
--     vim.g.molten_use_border_highlights = false
--   end,
--   config = function()
--     -- Molten keybindings
--     vim.keymap.set("n", "<leader>ji", ":MoltenInit<CR>", { desc = "Initialize kernel" })
--     vim.keymap.set("n", "<leader>js", ":MoltenInfo<CR>", { desc = "Show kernel status" })
--     vim.keymap.set("n", "<leader>jl", ":MoltenEvaluateLine<CR>", { desc = "Evaluate current line" })
--     vim.keymap.set("v", "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Evaluate visual selection" })
--     vim.keymap.set("n", "<leader>je", ":MoltenEvaluateOperator<CR>", { desc = "Evaluate with operator" })
--
--     -- Output management
--     vim.keymap.set("n", "<leader>jo", ":MoltenShowOutput<CR>", { desc = "Open/show output" })
--     vim.keymap.set("n", "<leader>jh", ":MoltenHideOutput<CR>", { desc = "Hide output" })
--     vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>", { desc = "Delete cell" })
--
--     -- Cell navigation (these might conflict    vim.g.molten_virt_text_output = false with your existing pyworks keybindings)
--     vim.keymap.set("n", "<leader>j]", ":MoltenNext<CR>", { desc = "Next cell" })
--     vim.keymap.set("n", "<leader>j[", ":MoltenPrev<CR>", { desc = "Previous cell" })
--
--     -- Image management (for Kitty/Ghostty)
--     vim.keymap.set("n", "<leader>jc", ":MoltenImageClear<CR>", { desc = "Clear images" })
--     vim.keymap.set(
--       "n",
--       "<leader>jC",
--       ":MoltenImageClear<CR>:MoltenReevaluateCell<CR>",
--       { desc = "Clear images & re-run cell" }
--     )
--   end,
-- }

return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  ft = { "python", "json" },
  dependencies = {
    "3rd/image.nvim",
  },
  build = ":UpdateRemotePlugins",
  init = function()
    -- Enable inline output using virtual lines and virtual text
    vim.g.molten_use_floating_win = false
    vim.g.molten_auto_open_output = true
    vim.g.molten_virt_lines_output = true
    vim.g.molten_virt_text_output = true

    -- This tells molten.nvim to use image.nvim for rendering images
    vim.g.molten_image_provider = "image.nvim"

    -- This is the new line to remove the borderlines
    vim.g.molten_virtual_output_border = "none"

    -- Configure image.nvim to show images without taking up a full line.
    vim.g.image_nvim_show_image_on_line = false
  end,
  config = function()
    -- Define a custom highlight group for molten output to make it "in the background".
    vim.api.nvim_set_hl(0, "MoltenOutput", { link = "Comment" })

    -- ADDED: Disable the highlight on the output when your cursor is near it
    vim.api.nvim_set_hl(0, "MoltenActiveOutput", { link = "MoltenOutput" })

    -- All your keymaps can remain as they are
    vim.keymap.set("n", "<leader>ji", ":MoltenInit<CR>", { desc = "Initialize kernel" })
    vim.keymap.set("n", "<leader>js", ":MoltenInfo<CR>", { desc = "Show kernel status" })
    vim.keymap.set("n", "<leader>jl", ":MoltenEvaluateLine<CR>", { desc = "Evaluate current line" })
    vim.keymap.set("v", "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Evaluate visual selection" })
    vim.keymap.set("n", "<leader>je", ":MoltenEvaluateOperator<CR>", { desc = "Evaluate with operator" })
    vim.keymap.set("n", "<leader>jo", ":MoltenShowOutput<CR>", { desc = "Open/show output" })
    vim.keymap.set("n", "<leader>jh", ":MoltenHideOutput<CR>", { desc = "Hide output" })
    vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>", { desc = "Delete cell" })
    vim.keymap.set("n", "<leader>j]", ":MoltenNext<CR>", { desc = "Next cell" })
    vim.keymap.set("n", "<leader>j[", ":MoltenPrev<CR>", { desc = "Previous cell" })
    vim.keymap.set("n", "<leader>jc", ":MoltenImageClear<CR>", { desc = "Clear images" })
    vim.keymap.set(
      "n",
      "<leader>jC",
      ":MoltenImageClear<CR>:MoltenReevaluateCell<CR>",
      { desc = "Clear images & re-run cell" }
    )
  end,
}

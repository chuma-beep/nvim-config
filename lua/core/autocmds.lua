-- core/autocmds.lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.c",
  command = "silent! !clang-format -i %",
})

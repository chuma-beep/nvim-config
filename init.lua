-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 1) Bootstrap lazy.nvim
vim.opt.runtimepath:prepend(vim.env.HOME .. "/.local/share/nvim/lazy/lazy.nvim")

-- 2) Load plugin list
--require("plugins.plugin_manager")

-- 3) Core settings
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 4) Plugin configs
require("plugins.lsp")
require("plugins.treesitter")

--require("plugins.cmp")

  -- 5) Extras
  --require("extras.dap")
  --require("extras.snippets")

  -- init.lua
  -- … existing bootstrap and core…
  --require("plugins.lsp") -- your C LSP
  --require("plugins.lsp_js") -- JS/TS LSP
  --require("plugins.lsp_python") -- Python LSP
  --require("plugins.treesitter") -- now covers C, JS/TS, Python
  --require("plugins.cmp") -- completion
  -- … extras …
  --

  -- lua/init.lua or lua/plugins/init.lua

  -- I put this for py works


vim.opt.clipboard = "unnamedplus"

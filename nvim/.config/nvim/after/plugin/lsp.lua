----- IMPORTANT -----
-- see :h lsp-zero-keybindings
local lsp = require('lsp-zero')
lsp.ensure_installed({ 'lua_ls' })
lsp.preset('recommended');
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

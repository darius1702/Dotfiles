require('telescope').setup {
  pickers = {
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
    help_tags = {
      theme = "ivy",
    },
    man_pages = {
      -- list all sections instead of just (1)
      sections = { "ALL" },
      theme = "ivy",
    },
  },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})

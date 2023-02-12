-- telescope finder
vim.keymap.set('n', '<leader>tr', '<cmd>Telescope ros ros<cr>', { noremap = true })

-- follow links in launch files
vim.keymap.set('n', '<leader>rol', function() require("ros-nvim.ros").open_launch_include() end, { silent = true, noremap = true })

-- show definition for messages/services in floating window
vim.keymap.set('n', '<leader>rdm', function() require("ros-nvim.ros").show_message_definition() end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>rds', function() require("ros-nvim.ros").show_service_definition() end, { silent = true, noremap = true })

require('nvim-treesitter.configs').setup{
  highlight = {
    enable = true,
    disable =  { "latex" },
    additional_vim_regex_highlughting = false,
  }
}
require('telescope').setup{}
require('neogit').setup{}
require('colorizer').setup{
  '*'; -- highlight all files
}
require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Documents/Notes/neorg",
                },
            },
        },
    },
}

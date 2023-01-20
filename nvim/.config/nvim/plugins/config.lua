require('nvim-treesitter.configs').setup{
  highlight = {
    enable = true,
    disable =  { "latex" },
    additional_vim_regex_highlughting = false,
  }
}
require('telescope').setup{}
require('colorizer').setup{
  '*'; -- highlight all files
}

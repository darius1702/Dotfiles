require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help", "cpp", "markdown" },

  sync_install = false,

  auto_install = true,

  highlight = {

    enable = true,

    -- Let vimtex handle latex highlighting
    disable = { "latex" },

    additional_vim_regex_highlighting = false,
  }
}

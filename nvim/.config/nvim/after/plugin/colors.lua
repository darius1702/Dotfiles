require("no-clown-fiesta").setup {
  transparent = true,
}

function set_colors(color)
  color = color or "no-clown-fiesta"
  vim.cmd.colorscheme(color)
end

set_colors()

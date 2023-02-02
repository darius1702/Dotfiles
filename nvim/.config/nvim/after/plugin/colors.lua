function set_colors(color)
	color = color or "iceberg"
	vim.cmd.colorscheme(color)
end

set_colors()

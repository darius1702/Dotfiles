vim.cmd([[set spelllang=de_de,en_us]])
local settings = {
  bg = "dark",
  scrolloff = 3,
  signcolumn = "yes",
  showmode = false,
  laststatus = 2,
  cmdheight = 1,
  encoding = "utf-8",
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  langmenu = "en_US",
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  autoindent = true,
  smartindent = true,
  breakindent = true,
  hidden = true,
  updatetime = 50,
  go = "a",
  mouse = "a",
  hlsearch = false,
  ignorecase = true,
  undofile = true,
  undodir="$HOME/.config/nvim/undo",
  undoreload = 10000,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = {
  build_dir = "build",
}
vim.g.VimuxUseNearest = 0
vim.g.VimuxPromptString = "Run: "

vim.g.netrw_altw = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

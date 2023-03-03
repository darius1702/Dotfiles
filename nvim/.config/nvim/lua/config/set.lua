vim.cmd([[set spelllang=en_us]])
local settings = {

  -- default values anyway, maybe remove sometime
  bg = "dark",
  hidden = true,
  encoding = "utf-8",
  laststatus = 2,
  --

  scrolloff = 3,
  signcolumn = "yes",
  showmode = false,
  showcmd = false,
  cmdheight = 1,
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
  updatetime = 50,
  go = "a",
  mouse = "a",
  hlsearch = false,
  ignorecase = true,
  undofile = true,
  undoreload = 10000,
}

vim.cmd([[set undodir=$HOME/.config/nvim/undo]])

for k, v in pairs(settings) do
  vim.opt[k] = v
end

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_compiler_latexmk = {
  build_dir = "build",
}
vim.g.VimuxUseNearest = 0
vim.g.VimuxPromptString = "Run: "

vim.g.netrw_altw = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

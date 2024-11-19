vim.cmd([[set spelllang=en_us]])
local settings = {

  -- default values anyway, maybe remove sometime
  bg = "dark",
  hidden = true,
  encoding = "utf-8",
  ruler = true,
  --

  laststatus = 1,
  scrolloff = 3,
  signcolumn = "yes",
  cursorline = true,
  showmode = false,
  showcmd = false,
  cmdheight = 1,
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  langmenu = "en_US",
  expandtab = true,
  shiftwidth = 4,
  softtabstop = 4,
  autoindent = true,
  smartindent = true,
  breakindent = true,
  updatetime = 50,
  mouse = "a",
  hlsearch = false,
  ignorecase = true,
  undofile = true,
  undoreload = 10000,
}

vim.cmd([[set undodir=$HOME/.config/nvim/undo]])
vim.o.grepprg="rg --vimgrep --no-heading -i --"

for k, v in pairs(settings) do
  vim.opt[k] = v
end

vim.g.netrw_altw = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

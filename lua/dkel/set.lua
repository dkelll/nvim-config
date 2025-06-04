vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

--  https://neovim.io/doc/user/usr_27.html#_ignoring-case
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "130"
vim.opt.termguicolors = true

vim.opt.updatetime = 50

-- Ignore some of the annoying lsp providers that I'll probably never use
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


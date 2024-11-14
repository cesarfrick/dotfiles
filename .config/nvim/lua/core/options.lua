local opt = vim.opt

--- Indentation ---
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

--- Line Wrapping ---
opt.wrap = true

--- Line Numbers ---
opt.relativenumber = true
opt.number = true

--- Search ---
opt.hlsearch = true
opt.incsearch = true

--- Folding ---
opt.foldenable = true
opt.foldlevel = 1
opt.foldmethod = "syntax"
opt.foldnestmax = 10

--- Mouse ---
opt.mouse = "a"
opt.mousemoveevent = true

--- Clipboard ---
opt.clipboard:append("unnamedplus")

--- Line Highlight ---
opt.cursorline = true

--- Terminal ---
opt.termguicolors = true
opt.signcolumn = "yes"

--- Split ---
opt.splitright = true
opt.splitbelow = true

--- Tabline ---
opt.showtabline = 2

--- Statusline ---
opt.laststatus = 3
opt.splitkeep = "screen"

--- Search ---
opt.ignorecase = true
opt.smartcase = true

--- VSCode ---
vim.g.vscode = true

--- Others ---
vim.opt_local.conceallevel = 2
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

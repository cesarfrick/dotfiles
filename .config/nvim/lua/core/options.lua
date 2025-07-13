local opt = vim.opt

vim.o.sessionoptions = "localoptions"
vim.lsp.inlay_hint.enable(false)
vim.lsp.set_log_level("debug")

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

--- Astro ---
vim.filetype.add({
	extension = {
		astro = "astro",
		mdx = "mdx",
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
		py = "python",
	},
})

vim.treesitter.language.register("markdown", "mdx")

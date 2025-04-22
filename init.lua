local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('rebelot/kanagawa.nvim')
Plug('windwp/nvim-autopairs')
Plug('nvim-lualine/lualine.nvim')
Plug('pysan3/fcitx5.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
vim.call('plug#end')

vim.g.mapleader=' '

vim.o.rnu = true
vim.o.nu = true
vim.o.shiftwidth = 8
vim.o.tabstop = 8
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd.colorscheme('kanagawa-wave')
vim.cmd('nnoremap <silent> <leader>h :noh<CR>')
vim.cmd('inoremap <silent> <C-s> <Esc>:w<CR>')
vim.cmd('nnoremap <silent> <leader>s :w<CR>')
vim.cmd('nnoremap <silent> <leader>x :x<CR>')

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')

vim.diagnostic.config({virtual_text = true})

require('nvim-autopairs').setup({})

local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<M-b>'] = cmp.mapping.scroll_docs(-5),
		['<M-f>'] = cmp.mapping.scroll_docs(5),
		['<M-Space>'] = cmp.mapping.complete(),
		['<M-e>']= cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({select = true}),
		['<M-j>'] = cmp.mapping.select_next_item(),
		['<M-k>'] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'buffer'},
	})
})

require('fcitx5').setup({
	imname = {
		norm = 'keyboard-us',
	},
})

require('lualine').setup({
	options = {
		icons_enabled = false,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
	},
	sections = {
		lualine_b = {},
		lualine_c = {'filename', 'diagnostics'},
		lualine_x = {'branch'},
	},
})

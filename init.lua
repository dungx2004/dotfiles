local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('rebelot/kanagawa.nvim')
Plug('windwp/nvim-autopairs')
Plug('nvim-lualine/lualine.nvim')
Plug('pysan3/fcitx5.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
vim.call('plug#end')

vim.g.mapleader=' '

vim.o.rnu = true
vim.o.nu = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd.colorscheme('kanagawa-wave')
vim.cmd('nnoremap <silent> <leader>h :noh<CR>')
vim.cmd('inoremap <silent> <C-s> <Esc>:w<CR>a')
vim.cmd('nnoremap <silent> <leader>s :w<CR>')
vim.cmd('nnoremap <silent> <leader>x :x<CR>')

require('mason').setup()
require('mason-lspconfig').setup()
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')

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
		['<M-j>'] = cmp.mapping.scroll_docs(5),
		['<M-k>'] = cmp.mapping.scroll_docs(-5),
		['<M-e>']= cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({select = true}),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
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
		lualine_x = {'branch', 'diff'},
	},
})

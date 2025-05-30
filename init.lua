local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('rebelot/kanagawa.nvim')
Plug('windwp/nvim-autopairs')
Plug('nvim-lualine/lualine.nvim')
Plug('h-hg/fcitx.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
vim.call('plug#end')

vim.o.rnu = true
vim.o.nu = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd.colorscheme('kanagawa')

vim.g.mapleader=' '
vim.cmd('nnoremap <silent> <leader>h :noh<CR>')
vim.cmd('nnoremap <silent> <leader>s :w<CR>')
vim.cmd('nnoremap <silent> <leader>e :w<CR>:e<CR>')
vim.cmd('nnoremap <silent> <leader>r :set rnu<CR>')
vim.cmd('nnoremap <silent> <leader>n :set nornu<CR>')

require('nvim-autopairs').setup({})

require('mason').setup()
require('mason-lspconfig').setup()
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.diagnostic.config({virtual_text = true, signs = false})

local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<M-d>'] = cmp.mapping.scroll_docs(5),
		['<M-u>'] = cmp.mapping.scroll_docs(-5),
		['<M-e>']= cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({select = true}),
		['<M-j>'] = cmp.mapping.select_next_item(),
		['<M-k>'] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'buffer'},
	}),
	formatting = {
		format = function(_, item)
			local MAX_LABEL_WIDTH = 20
			local content = item.abbr
			if #content > MAX_LABEL_WIDTH then
				item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. '…'
			else
				item.abbr = content .. (' '):rep(MAX_LABEL_WIDTH - #content)
			end
			return item
		end
	}
})

require('lualine').setup({
	options = {
		icons_enabled = false,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
	},
	sections = {
		lualine_b = {},
		lualine_x = {'diagnostics', 'branch',' diff'},
	},
})

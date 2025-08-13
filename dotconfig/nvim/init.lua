local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('rebelot/kanagawa.nvim')
Plug('windwp/nvim-autopairs')
Plug('h-hg/fcitx.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('RaafatTurki/hex.nvim')
vim.call('plug#end')

vim.o.rnu = true
vim.o.nu = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.mapleader = ' '
vim.cmd('nnoremap <silent> <leader>s :w<CR>')
vim.cmd('nnoremap <silent> <leader>h :noh<CR>')
vim.cmd('nnoremap <silent> <leader>e :w<CR>:e<CR>')
vim.cmd('nnoremap <silent> <leader>b :HexToggle<CR>')

vim.cmd.colorscheme('kanagawa')

require('nvim-autopairs').setup()

require('mason').setup()
require('mason-lspconfig').setup()
vim.diagnostic.config({ signs = false, severity_sort = true, jump = {float = true} })

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
				item.abbr = vim.fn.strcharpart(content, 0,
				MAX_LABEL_WIDTH) .. '…'
			else
				item.abbr = content .. (' '):rep(MAX_LABEL_WIDTH
				- #content)
			end
			return item
		end
	}
})

require('hex').setup()

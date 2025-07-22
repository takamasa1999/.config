-- https://github.com/hrsh7th/nvim-cmp
-- plugins/cmp.lua
return {
	-- Main Completion plugin
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- for vsnip
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-vsnip",

			-- OPTIONAL alternatives:
			-- 'L3MON4D3/LuaSnip',
			-- 'saadparwaiz1/cmp_luasnip',
			-- 'SirVer/ultisnips',
			-- 'quangnguyen30192/cmp-nvim-ultisnips',
			-- 'dcampos/nvim-snippy',
			-- 'dcampos/cmp-snippy',
			-- 'echasnovski/mini.snippets',
			-- 'abeldekat/cmp-mini-snippets',
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users
						-- require('luasnip').lsp_expand(args.body)
						-- vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" }, -- vsnip
				}, {
					{ name = "buffer" },
				}),
			})

			-- `/` and `?` for buffer search
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` for path and cmdline
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- LSP capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Replace with your LSP servers
			require("lspconfig")["lua_ls"].setup({ capabilities = capabilities })
			-- require('lspconfig')['pyright'].setup { capabilities = capabilities }
		end,
	},
}

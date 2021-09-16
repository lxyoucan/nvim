local nvim_lsp = require('lspconfig')


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {'tsserver' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = Itkey_on_attach,
		capabilities = Itkey_capabilities,
	}
end



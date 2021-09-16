local nvim_lsp = require('lspconfig')
--json支持
nvim_lsp.jsonls.setup {
	on_attach = function(client, bufnr)
		-- 代码保存自动格式化formatting
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_command [[augroup Format]]
			vim.api.nvim_command [[autocmd! * <buffer>]]
			vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})]]
			vim.api.nvim_command [[augroup END]]
		end
	end,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			end
		}
	}
}



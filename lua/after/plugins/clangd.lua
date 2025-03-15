local lsp = require('lsp-zero')


require('lspconfig').clangd.setup({
	cmd = {
		"clangd",
		"--clang-tidy",
		"--function-arg-placeholders",
		"--completion-style=detailed"
	}
})


lsp.setup()

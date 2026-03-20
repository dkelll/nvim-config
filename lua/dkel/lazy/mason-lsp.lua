return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "neovim/nvim-lspconfig", lazy = false },
	},
	config = function()
		require("mason").setup()

		-- Ensure nvim-lspconfig's lsp/ dir is in runtimepath for default configs
		local lspconfig_path = vim.fn.stdpath("data") .. "/lazy/nvim-lspconfig"
		if not vim.tbl_contains(vim.opt.runtimepath:get(), lspconfig_path) then
			vim.opt.runtimepath:prepend(lspconfig_path)
		end

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
			},
		})

		vim.lsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end
				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					workspace = {
						checkThirdParty = false,
						library = { vim.env.VIMRUNTIME },
					},
				})
			end,
			settings = {
				Lua = {
					format = {
						enable = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			root_dir = function(bufnr, on_dir)
				-- -- Don't start ts_ls in SFDX projects (lwc_ls handles those)
				-- if vim.fs.root(bufnr, { "sfdx-project.json" }) then
				-- 	return
				-- end
				local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json", ".git" })
				if root then
					on_dir(root)
				end
			end,
		})

		vim.lsp.config("apex_ls", {
			apex_jar_path = vim.fn.stdpath("data") .. "/mason/share/apex-language-server/apex-jorje-lsp.jar",
			apex_enable_semantic_errors = false,
			apex_enable_completion_statistics = false,
		})

		vim.lsp.config("lwc_ls", {
			cmd = {
				"node",
				vim.fn.expand(
					"~/Projects/lightning-language-server/packages/lwc-language-server/bin/lwc-language-server.js"
				),
				"--stdio",
			},
			init_options = {
				embeddedLanguages = { javascript = true },
			},
		})

		vim.lsp.config("zls", {
			settings = {
				zls = {
					enable_inlay_hints = true,
					enable_snippets = true,
					warn_style = true,
				},
			},
		})

		vim.lsp.enable({
			"lua_ls",
			"ts_ls",
			"gopls",
			"rust_analyzer",
			"yamlls",
			"zls",
			"apex_ls",
			"lwc_ls",
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}

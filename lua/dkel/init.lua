require("dkel.set")
require("dkel.remap")
require("dkel.lazy_init")
-- require("dkel.sfdc")

local augroup = vim.api.nvim_create_augroup
local DkelGroup = augroup("Dkel", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

-- Good for debugging, ex. `:lua P(vim.api.nvim_get_keymap('n'))` to see all keybindings
function P(v)
	print(vim.inspect(v))
	return v
end

vim.filetype.add({
	extension = {
		cls = "apex",
		trigger = "apex",
		apxc = "apexcode",
	},
	pattern = {
		[".*/*.cls"] = "apex",
		[".*/*.trigger"] = "apex",
		["go%.work"] = "gowork",
		[".*%.go%.tmpl"] = "gotmpl",
		["docker%-compose%.ya?ml"] = "yaml.docker-compose",
		[".*%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
		["values%.ya?ml"] = "yaml.helm-values",
	},
})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- autocmd({ "BufWritePre" }, {
-- 	group = DkelGroup,
-- 	pattern = "*",
-- 	command = [[%s/\s\+$//e]],
-- })

autocmd("LspAttach", {
	group = DkelGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "]e", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		vim.keymap.set("n", "[e", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)

		local client = vim.lsp.get_client_by_id(e.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight") then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = e.buf,
				callback = function()
					vim.lsp.buf.document_highlight()
				end,
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				buffer = e.buf,
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})
		end

		-- Linked editing (edit matching open/close HTML tags simultaneously, Neovim 0.11+)
		if vim.lsp.buf.linked_editing_range then
			vim.keymap.set("n", "<leader>vle", vim.lsp.buf.linked_editing_range, opts)
		end
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()

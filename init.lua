require("dkel")

-- TODO: figure out why I even need this; I thought my shell was sourced already...
vim.env.PATH = vim.env.PATH .. ":" .. "/usr/local/go/bin"
vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang

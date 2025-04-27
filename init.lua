require("dkel")

vim.filetype.add({
    extension = {
        apex = "apex",
        cls = "apex",
        trigger = "apex",
        soql = "soql",
        sosl = "sosl",
    },
})
-- TODO: figure out why I even need this; I thought my shell was sourced already...
vim.env.PATH = vim.env.PATH .. ":" .. "/usr/local/go/bin"

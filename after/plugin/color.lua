vim.g.tokyokight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"

require("rose-pine").setup({
    dark_variant = 'moon',
})

function ColorMyPencils(color)
    color = color or "nordfox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })

end

ColorMyPencils()

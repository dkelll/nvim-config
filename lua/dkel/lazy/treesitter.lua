return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter'.setup {
                -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
                install_dir = vim.fn.stdpath('data') .. '/site'
            }
            require'nvim-treesitter'.install {
                "vimdoc",
                "javascript",
                "typescript",
                "c",
                "lua",
                "rust",
                "jsdoc",
                "bash",
                "go",
                "apex",
                "soql",
                "sosl",
                "sflog"
            }

            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "c",
                    "lua",
                    "rust",
                    "jsdoc",
                    "bash",
                    "go",
                    "apex",
                    "soql",
                    "sosl",
                    "sflog"
                },
                callback = function() vim.treesitter.start() end,
            })
        end
    }
}
                -- ensure_installed = {
                --     "vimdoc",
                --     "javascript",
                --     "typescript",
                --     "c",
                --     "lua",
                --     "rust",
                --     "jsdoc",
                --     "bash",
                --     "go",
                --     "apex",
                --     "soql",
                --     "sosl",
                --     "sflog"
                -- },


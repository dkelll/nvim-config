return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require('telescope').setup({
            defaults = {
                buffer_previewer_maker = function(filepath, bufnr, opts)
                    -- Disable syntax highlighting to avoid the error
                    vim.api.nvim_buf_set_option(bufnr, 'syntax', 'off')
                end,
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ts', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>ep', function()
            builtin.find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"),"lazy")
            }
        end)
        vim.keymap.set('n', '<leader>ep', function()
            builtin.find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"),"lazy")
            }
        end
        -- require"dkel.telescope.multigrep".setup()
    end
}

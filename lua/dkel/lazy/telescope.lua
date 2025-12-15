return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {

      pickers = {
        find_files = {
          theme = "ivy"
        }
      },
      extensions = {
        fzf = {}
      }
    }

    require('telescope').load_extension('fzf')

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
    -- require"dkel.telescope.multigrep".setup()
  end
}

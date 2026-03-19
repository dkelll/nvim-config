return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "FileType" },

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
      require('nvim-treesitter').setup()

      -- Enable treesitter highlighting for the current buffer and all future buffers
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Also start for the current buffer since FileType already fired before this plugin loaded
      if vim.bo.filetype ~= '' then
        pcall(vim.treesitter.start, 0)
      end
    end,
  },
}

-- Recommeneded by ChatGPT. Gives you sticky code when you're in a function, loop, if block, etc.
return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      enable = true,
      max_lines = 4,
      trim_scope = "outer",
    },
  },
}

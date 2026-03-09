-- Recommended by ChatGPT. Not sure if I want all of this yet
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "rust",
        "elixir",
        "apex",
        "soql",
        "sosl",
        "cpp",
        "zig",
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },

        move = {
          enable = true,
          set_jumps = true,

          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },

          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
      },
    },
  },
}


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.apex = {
  install_info = {
    -- url = "https://github.com/dkelll/tree-sitter-apex", -- local path or git repo
     url = "https://github.com/dkelll/tree-sitter-apex", -- local path or git repo
    files = {
        "src/parser.c",
    },
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "cls",
}

parser_config.soql = {
  install_info = {
    url = "https://github.com/dkelll/tree-sitter-soql", -- local path or git repo
    files = {
        "src/parser.c",
    },
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}

parser_config.sosl = {
  install_info = {
    url = "https://github.com/dkelll/tree-sitter-sosl", -- local path or git repo
    files = {
        "src/parser.c",
    },
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"apex","soql","sosl"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    additional_vim_regex_highlighting = false
  }
}


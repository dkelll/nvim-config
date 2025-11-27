return {
        enabled = true,
        "sf",
        dir = "~/plugins/sf.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local sf = require("sf")
            --vim.keymap.set("n", "<leader>sf", function() sf.toggle_window() end)
        end
}


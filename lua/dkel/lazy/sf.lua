return {
        enabled = false,
        "sf",
        dir = "~/plugins/sf.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local sf = require("sf")
            --vim.keymap.set("n", "<leader>sf", function() sf.toggle_window() end)
        end
}


return {
        "sf",
        dir = "~/projects/plugins/sf.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local sf = require("sf")
            sf.setup()
            vim.keymap.set("n", "<leader>sf", function() sf.toggle_window() end)
        end
}


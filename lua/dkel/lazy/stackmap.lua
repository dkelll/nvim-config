return {
        "stackmap",
        dir = "~/projects/plugins/stackmap.nvim",
        config = function()
            local stackmap = require("stackmap")
            vim.keymap.set("n", "<leader>sm", function()
                print("stackmap shortcut")
            end)
        end
}

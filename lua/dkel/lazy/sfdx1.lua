local plugins = {
    {
        "sfdx",
        dir = "~/Projects/nvim-plugins/sfdx.nvim",
        config = function()
            local sfdx = require("sfdx")
            sfdx.openDefaultOrg()
            -- vim keymap.set("n", "<leader>sfo", function() sfdx.set_org() end)
        end
    }
}

return plugins;


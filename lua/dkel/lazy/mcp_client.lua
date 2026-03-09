return {
    "mcp_client",
    dir = "~/Projects/nvim_mcpclient", -- local plugin path
    config = function()
        local mcp = require("mcp_client")
        mcp.setup({
            server_url = "mcp://localhost:30000/github?key=742e4480bc17bd763c227f21010e4f469d2972d00089706720daff54e7221cbc",
            max_tokens = 2000,
        })
    end
}

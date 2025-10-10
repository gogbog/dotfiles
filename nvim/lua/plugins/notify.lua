return {
    "rcarriga/nvim-notify",
    lazy = false,   -- lazy load
    priority = 1000,
    config = function()
        local notify = require("notify")
        notify.setup({
            -- your settings here
            stages = "static",
            timeout = 3500,
        })
        vim.notify = notify  -- override default vim.notify
    end,
}


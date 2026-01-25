return {
    "folke/tokyonight.nvim",
    config = function()
        local tokyonight = require('tokyonight')
        local opts = {
            transparent = true,
            hide_inactive_statusline = true,
            dim_inactive = true,
        }

        tokyonight.setup(opts)
    end
}

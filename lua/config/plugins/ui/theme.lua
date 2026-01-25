return {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
        local tokyonight = require('tokyonight')
        local opts = {
            transparent = true,
            hide_inactive_statusline = true,
            dim_inactive = true,
        }

        tokyonight.setup(opts)

        vim.cmd [[ colorscheme tokyonight-night ]]
        vim.lsp.set_log_level("info")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#ec5f67' })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#c678dd' })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#008080' })
    end
}

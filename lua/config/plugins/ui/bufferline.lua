return {
    "akinsho/bufferline.nvim",
    lazy = false,
    config = function()
        local status, bufferline = pcall(require, "bufferline")
        if (not status) then return end

        local opts = {
            options = {
                mode = "tabs",
                themable = true,
                indicator = {
                    style = "underline"
                },
                separator_style = 'slant',
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true
                    }
                },
                color_icons = true,
            }
        }

        bufferline.setup(opts)

        vim.keymap.set('n', 'gt', [[:BufferLineCycleNext<CR>]])
        vim.keymap.set('n', 'gT', [[:BufferLineCyclePrev<CR>]])
    end,
}

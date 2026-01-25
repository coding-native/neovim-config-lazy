return {
    "akinsho/bufferline.nvim",
    init = function()
        vim.keymap.set('n', 'gt', [[:BufferLineCycleNext<CR>]])
        vim.keymap.set('n', 'gT', [[:BufferLineCyclePrev<CR>]])
    end,
    opts = {
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
    },
}

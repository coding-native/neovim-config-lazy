return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    -- Plenary installed elsewhere
    -- requires = { {"nvim-lua/plenary.nvim"} },
    opts = {},
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon").list():add()
            end,
            desc = "Harpoon Add File"
        },
        {
            "<leader>r",
            function()
                require("harpoon").list():remove()
            end,
            desc = "Harpoon Remove File"
        },
        {
            "<C-e>",
            function() require("harpoon").ui:toggle_quick_menu(require("harpoon").list()) end,
            desc = "Harpoon Toggle Quick Menu"
        },

        {
            "<C-h>",
            function()
                require("harpoon").list():select(1)
            end,
            desc = "Harpoon Go to File 1"
        },
        {
            "<C-t>",
            function()
                require("harpoon").list():select(2)
            end,
            desc = "Harpoon Go to File 2"
        },
        {
            "<C-n>",
            function()
                require("harpoon").list():select(3)
            end,
            desc = "Harpoon Go to File 3"
        },
        {
            "<C-s>",
            function()
                require("harpoon").list():select(4)
            end,
            desc = "Harpoon Go to File 4"
        },
        {
            "<C-S-P>",
            function() require("harpoon").list():prev() end,
            desc = "Harpoon Previous File"
        },
        {
            "<C-S-N>",
            function() require("harpoon").list():next() end,
            desc = "Harpoon Next File"
        },
        {
            "<C-e>",
            function()
                local harpoon_files = require("harpoon").list()
                local config = require("telescope.config").values
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = config.file_previewer({}),
                    sorter = config.generic_sorter({}),
                }).find()
            end,
            desc = "Harpoon Open Telescope"
        }
    }
}

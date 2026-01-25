return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local treesitter = require("nvim-treesitter")
        local parser_config = require("nvim-treesitter.parsers")

        treesitter.setup {
            modules = {},
            ignore_install = {},
            sync_install = false,
            auto_install = true,
            ensure_installed = {
                "bicep",
                "bash",
                "c",
                "css",
                "c_sharp",
                "cmake",
                "cpp",
                "diff",
                "dockerfile",
                "go",
                "graphql",
                "html",
                "jsdoc",
                "json",
                "json5",
                "latex",
                "lua",
                "make",
                "markdown",
                "python",
                "regex",
                "rust",
                "scss",
                "sql",
                "templ",
                "terraform",
                "toml",
                "tsx",
                "twig",
                "vim",
                "yaml",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = {},
            },
            autotag = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        }
        parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
        vim.treesitter.language.register('templ', 'templ')
        vim.treesitter.language.register('twig', 'tera')
        vim.api.nvim_create_autocmd({ "FileType" }, {
            callback = function()
                local parsers = require("nvim-treesitter.parsers")
                if parsers.has_parser() then
                    vim.opt.foldmethod = "expr"
                    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
                else
                    vim.opt.foldmethod = "syntax"
                end
            end,
        })
    end
}

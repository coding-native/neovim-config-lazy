return {
    'esensar/nvim-dev-container',
    opts = {
        attach_mounts = {
            neovim_config = {
                enabled = true,
                options = { "readonly" },
            },
            neovim_data = {
                enabled = false,
                options = {}
            },
            neovim_state = {
                enabled = false,
                options = {}
            }
        }
    },
    keys = {
        { '<leader>dcs',  [[:DevcontainerStart<CR>]],           desc = 'Devcontainer Start' },
        { '<leader>dca',  [[:DevcontainerAttach<CR>]],          desc = 'Devcontainer Attach' },
        { '<leader>dcr',  [[:DevcontainerStop<CR>]],            desc = 'Devcontainer Stop' },
        { '<leader>dcf',  [[:DevcontainerFullScreenEnter<CR>]], desc = 'Devcontainer Full Screen Enter' },
        { '<leader>dcff', [[:DevcontainerFullScreenExit<CR>]],  desc = 'Devcontainer Full Screen Exit' },
    }
}

return {
    'esensar/nvim-dev-container',
    config = function()
        local status, devcontainer = pcall(require, 'devcontainer')
        if (not status) then return end
        local opts = {
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
        }

        devcontainer.setup(opts)
    end,
    keys = {
        { '<leader>dcs',  '<cmd>DevcontainerStart<CR>',           desc = 'Devcontainer Start' },
        { '<leader>dca',  '<cmd>DevcontainerAttach<CR>',          desc = 'Devcontainer Attach' },
        { '<leader>dcr',  '<cmd>DevcontainerStop<CR>',            desc = 'Devcontainer Stop' },
        { '<leader>dcf',  '<cmd>DevcontainerFullScreenEnter<CR>', desc = 'Devcontainer Full Screen Enter' },
        { '<leader>dcff', '<cmd>DevcontainerFullScreenExit<CR>',  desc = 'Devcontainer Full Screen Exit' },
    },
}

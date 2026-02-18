return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = {
        theme = 'hyper',
        disable_move = false,
        shortcut_type = 'letter',
        change_to_vcs_root = true,
        config = {
            header = {
                ' Welcome back! Archibate',
                '',
            },
            project = {
                enable = true,
                limit = 8,
                action = 'Telescope fd cwd=',
            },
            shortcut = {
                {
                    desc = '󰊳 Update',
                    group = '@property',
                    action = 'Lazy update',
                    key = 'u',
                },
                {
                    desc = ' Recent',
                    group = '@type',
                    action = 'Telescope oldfiles',
                    key = 'r',
                },
                {
                    desc = ' Git',
                    group = 'Number',
                    action = 'Telescope git_status',
                    key = 'g',
                },
                {
                    desc = ' Search',
                    group = 'Character',
                    action = 'Telescope live_grep',
                    key = 's',
                },
                {
                    desc = ' Files',
                    group = 'Label',
                    action = 'Telescope fd',
                    key = 'f',
                },
                {
                    desc = ' Lazygit',
                    group = 'NoiceCmdline',
                    action = 'Telescope lazygit',
                    key = 'l',
                },
            },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

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
                'Welcome back! Archibate',
                '',
            },
            week_header = {
                enable = false,
            },
            shortcut = {
                {
                    desc = '󰊳 Update',
                    group = '@property',
                    action = 'Lazy update',
                    key = 'u',
                },
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    desc = ' Apps',
                    group = 'DiagnosticHint',
                    action = 'Telescope app',
                    key = 'a',
                },
                {
                    desc = ' Lazygit',
                    group = 'Number',
                    action = 'Telescope lazygit',
                    key = 'g',
                },
            },
        },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

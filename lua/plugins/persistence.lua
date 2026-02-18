return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
        branch = false,
    },
    keys = {
        {
            "<leader>qs",
            function()
                require("persistence").load()
            end,
            desc = "Load session",
        },
        {
            "<leader>qS",
            function()
                require("persistence").select()
            end,
            desc = "Select session",
        },
        {
            "<leader>ql",
            function()
                require("persistence").load({ last = true })
            end,
            desc = "Load last session",
        },
        {
            "<leader>qd",
            function()
                require("persistence").stop()
            end,
            desc = "Stop session saving",
        },
        {
            "<leader>qq",
            function()
                vim.cmd("wqall")
            end,
            desc = "Quit Neovim",
        },
    },
}

return {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        keys = "etovxqpdygfblzhckisuran",
    },
    keys = {
        {
            "f",
            function()
                if vim.v.count and vim.v.count > 0 then
                    vim.api.nvim_feedkeys(vim.v.count .. "f", "n", false)
                    return
                end
                require("hop").hint_char1({
                    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                    current_line_only = true,
                })
            end,
            remap = true,
            desc = "Hop: char1 after cursor",
        },

        {
            "F",
            function()
                if vim.v.count and vim.v.count > 0 then
                    vim.api.nvim_feedkeys(vim.v.count .. "F", "n", false)
                    return
                end
                require("hop").hint_char1({
                    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                    current_line_only = true,
                })
            end,
            remap = true,
            desc = "Hop: char1 before cursor",
        },

        {
            "t",
            function()
                if vim.v.count and vim.v.count > 0 then
                    vim.api.nvim_feedkeys(vim.v.count .. "t", "n", false)
                    return
                end
                require("hop").hint_char1({
                    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                    current_line_only = true,
                    hint_offset = -1,
                })
            end,
            remap = true,
            desc = "Hop: char1 till after cursor",
        },

        {
            "T",
            function()
                if vim.v.count and vim.v.count > 0 then
                    vim.api.nvim_feedkeys(vim.v.count .. "T", "n", false)
                    return
                end
                require("hop").hint_char1({
                    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                    current_line_only = true,
                    hint_offset = 1,
                })
            end,
            remap = true,
            desc = "Hop: char1 till before cursor",
        },

        {
            "<leader>jl",
            function()
                require("hop").hint_lines()
            end,
            desc = "Hop: jump to any line",
        },

        {
            "<leader>s",
            function()
                require("hop").hint_char2()
            end,
            desc = "Hop: char2 bidirectional",
        },

        {
            "<leader>jj",
            function()
                require("hop").hint_anywhere({
                    current_line_only = true,
                })
            end,
            desc = "Hop: anywhere in current line",
        },
    },
    config = function(_, opts)
        require("hop").setup(opts)
    end,
}

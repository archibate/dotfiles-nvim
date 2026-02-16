return {
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
            { "<leader>gc", "<cmd>LazyGitCurrentFile<cr>", desc = "Open LazyGit for current file" },
        },
        config = function()
            local ok, _ = pcall(require, "telescope")
            if ok then
                require("telescope").load_extension("lazygit")
            end
        end,
    },
}

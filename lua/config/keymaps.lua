-- Basic keymaps

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to window right" })

-- Resize windows
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Decrease window height" })
vim.keymap.set(
    "n",
    "<S-Left>",
    ":vertical resize +2<CR>",
    { noremap = true, silent = true, desc = "Increase window width" }
)
vim.keymap.set(
    "n",
    "<S-Right>",
    ":vertical resize -2<CR>",
    { noremap = true, silent = true, desc = "Decrease window width" }
)

-- Better indenting
vim.keymap.set("v", "<leader><", function()
    vim.cmd("normal! " .. vim.v.count1 .. "<gv")
    vim.fn["repeat#set"]("<leader><", vim.v.count)
end, { noremap = true, silent = true, desc = "Indent left" })
vim.keymap.set("v", "<leader>>", function()
    vim.cmd("normal! " .. vim.v.count1 .. ">gv")
    vim.fn["repeat#set"]("<leader>>", vim.v.count)
end, { noremap = true, silent = true, desc = "Indent right" })

-- Move selected line/block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- LSP keymaps will be set up in lsp.lua

-- Save all files
vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>wa<CR>", { noremap = true, silent = true, desc = "Save all files" })

-- Smart close with 'q'
vim.keymap.set("n", "q", function()
    local win_count = #vim.api.nvim_list_wins()
    local listed_bufs = #vim.tbl_filter(function(b)
        return vim.bo[b].buflisted and vim.api.nvim_buf_is_loaded(b)
    end, vim.api.nvim_list_bufs())

    local function save_if_modified(bufnr)
        if vim.bo[bufnr].modified and vim.bo[bufnr].modifiable and vim.bo[bufnr].buftype == "" then
            vim.cmd("write")
        end
    end

    if win_count > 1 then
        save_if_modified(0)
        vim.cmd("hide")
    elseif listed_bufs > 1 then
        save_if_modified(0)
        local current_buf = vim.api.nvim_get_current_buf()
        vim.cmd("bnext")
        vim.cmd("bdelete #")
    else
        save_if_modified(0)
        vim.cmd("quit")
    end
end, { desc = "Smart close window/buffer/quit with save" })

-- Map gq to original q (macro record)
vim.keymap.set("n", "gq", "q", { noremap = true, silent = true, desc = "Start macro recording" })

-- Buffer navigation
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[B", "<cmd>bfirst<CR>", { desc = "First buffer" })
vim.keymap.set("n", "]B", "<cmd>blast<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

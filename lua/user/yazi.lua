local yazi_hijack_netrw = vim.api.nvim_create_augroup("yazi_hijack_netrw", { clear = true })
local yazi_bufname
-- clear FileExplorer appropriately to prevent netrw from launching on folders
-- netrw may or may not be loaded before telescope-find-files
-- conceptual credits to nvim-tree and telescope-file-browser
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    once = true,
    callback = function()
        pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    group = yazi_hijack_netrw,
    pattern = "*",
    callback = function()
        vim.schedule(function()
            -- Early return if netrw or not a directory
            if vim.bo[0].filetype == "netrw" or vim.fn.isdirectory(vim.fn.expand("%:p")) == 0 then
                return
            end

            -- vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
            -- prevents reopening of file-browser if exiting without selecting a file
            local bufname = vim.api.nvim_buf_get_name(0)
            if yazi_bufname == bufname then
              yazi_bufname = nil
              return
            else
              yazi_bufname = bufname
            end
            require("yazi").yazi()
        end)
    end,
})

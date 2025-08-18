local status_ok, nvim_tmux= pcall(require, "nvim-tmux-navigation")
if not status_ok then
  print("nvim-tmux-navigation not found")
  return
end

nvim_tmux.setup({
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
    }
})

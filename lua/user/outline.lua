local status_ok, a = pcall(require, "outline")
if not status_ok then
  print("outline not found")
  return
end

a.setup({
  outline_window = {
    position = 'right',
    split_command = nil,
    width = 25,
    relative_width = true,
    wrap = false,
    focus_on_open = false,
    auto_close = false,
    auto_jump = false,
    show_numbers = false,
    show_relative_numbers = true,
    ---@type boolean|string?
    show_cursorline = true,
    hide_cursor = false,
    winhl = '',
    jump_highlight_duration = 400,
    center_on_jump = true,
  },
})

vim.cmd [[
nmap <expr> <C-n> ":<C-u>OutlineFollow<CR>" .. v:count1 .. "j<CR>"
nmap <expr> <C-p> ":<C-u>OutlineFollow<CR>" .. v:count1 .. "k<CR>"
]]

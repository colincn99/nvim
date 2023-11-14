local N = {} 

vim.cmd [[
  highlight Mode0 guibg=#5fafd7 guifg=#262626 gui=bold " NORMAL  
  highlight Mode1 guibg=#ffafd7 guifg=#262626 gui=bold " NORMAL  
]]

N.get_left = function(length)
  if length == 0 then
    return ""
  end
  local string = ""
  local colored = false
  for i = length, 1, -1
  do
    if not colored then
      string = string .. "%#Mode" .. math.floor(i / 10) % 2 .. "#"
      colored = true
    end
    string = string .. i % 10
    if i % 10 == 0 then
      string = string .. "%*"
      colored = false
    end
  end
  string = string .. "%*"
  return string
end

N.get_right = function(length)
  if length == 0 then
    return ""
  end
  local string = ""
  local colored = false
  for i = 1, length, 1
  do
    if not colored then
      string = string .. "%#Mode" .. math.floor(i / 10) % 2 .. "#"
      colored = true
    end
    string = string .. i % 10
    if i % 10 == 9 then
      string = string .. "%*"
      colored = false
    end
  end
  if colored then
    string = string .. "%*"
  end
  return string
end

N.get_string = function()
  local textoff = vim.fn.getwininfo(vim.fn.win_getid())[1].textoff
  local win_width = vim.fn.winwidth(0) - textoff
  local col_num = vim.fn.virtcol('.')
  return string.rep(" ", textoff) .. N.get_left(col_num - 1) .. '0' .. N.get_right(win_width - col_num)
end

_G.column_numbers = N
vim.o.winbar="%{%v:lua.column_numbers.get_string()%}" 
vim.cmd [[let &colorcolumn = join(range(3, 240, 3),',')]]
vim.opt.cursorcolumn = true
vim.opt.virtualedit = "all"

return N

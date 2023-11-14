local N = {} 

vim.cmd [[
  highlight WinBar           guifg=#BBBBBB gui=bold
  highlight WinBarNC         guifg=#888888 gui=bold
  highlight WinBarLocation   guifg=#888888 gui=bold
  highlight WinBarModified   guifg=#d7d787
  highlight WinBarGitDirty   guifg=#d7afd7
  highlight WinBarIndicator  guifg=#5fafd7 gui=bold
  highlight WinBarInactive   guibg=#3a3a3a guifg=#777777 gui=bold

  highlight ModeC guibg=#dddddd guifg=#101010 gui=bold " COMMAND 
  highlight ModeI guibg=#ffff5f guifg=#353535 gui=bold " INSERT  
  highlight ModeT guibg=#95e454 guifg=#353535 gui=bold " TERMINAL
  highlight ModeN guibg=#87d7ff guifg=#353535 gui=bold " NORMAL  
  highlight ModeN guibg=#5fafd7 guifg=#262626 gui=bold " NORMAL  
  highlight ModeV guibg=#c586c0 guifg=#353535 gui=bold " VISUAL  
  highlight ModeR guibg=#f44747 guifg=#353535 gui=bold " REPLACE 
  highlight Mode0 guibg=#5fafd7 guifg=#262626 gui=bold " NORMAL  
  highlight Mode1 guibg=#ffafd7 guifg=#262626 gui=bold " NORMAL  

  highlight StatusLine              guibg=#303030 guifg=#999999
  highlight StatusLineGit  gui=bold guibg=#3a3a3a guifg=#c586c0
  highlight StatusLineCwd  gui=bold guibg=#3a3a3a guifg=#999999
  highlight StatusLineFile gui=bold guibg=#303030 guifg=#bbbbbb
  highlight StatusLineMod           guibg=#303030 guifg=#d7d787
  highlight StatusLineError         guibg=#303030 guifg=#ff0000
  highlight StatusLineInfo          guibg=#303030 guifg=#87d7ff
  highlight StatusLineHint          guibg=#303030 guifg=#ffffd7
  highlight StatusLineWarn          guibg=#303030 guifg=#d7d700
  highlight StatusLineChanges       guibg=#303030 guifg=#c586c0
  highlight StatusLineOutside       guibg=#3a3a3a guifg=#999999
  highlight StatusLineTransition1   guibg=#303030 guifg=#1c1c1c
  highlight StatusLineTransition2   guibg=#3a3a3a guifg=#1c1c1c
]]


N.get_line = function(i)
  sections = {}
  while i > 0 
  do
    local j = math.max(math.floor(i / 10) * 10, 1)
    table.insert(sections, "%#Mode" .. j .. "#" .. "join(map(range(" .. i .. "," .. j .. ",-1),'v:val%10'),'')" .. "%*")
    i = j - 1
  end
  return sections
end

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
-- set winbar=%{'\ \ \ \ \ \ \ \'..join(map(range(virtcol('.')-1,0,-1),'v:val%10'),'')..join(map(range(1,200-virtcol('.')),'v:val%10'),'')}


return N

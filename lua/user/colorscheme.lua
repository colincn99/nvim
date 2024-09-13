local colorscheme = "flow"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.cmd [[
  highlight LineNr guifg=yellow ctermfg=yellow
  highlight LineNrAbove guifg=red ctermfg=red
  highlight LineNrBelow guifg=green ctermfg=green
]]

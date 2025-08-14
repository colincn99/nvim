local colorscheme = "flow"

if colorscheme == "flow" then
    require("flow").setup({})
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("colorscheme not loaded")
    return
end

vim.cmd [[
  highlight LineNr guifg=yellow ctermfg=yellow
  highlight LineNrAbove guifg=red ctermfg=red
  highlight LineNrBelow guifg=green ctermfg=green
]]

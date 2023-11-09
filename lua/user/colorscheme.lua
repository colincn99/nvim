local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end


local status_ok, _ = pcall(vim.cmd, "hi Search guibg=Red")
if not status_ok then
  return
end

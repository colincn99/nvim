local status_ok, oil = pcall(require, "oil")
if not status_ok then
  print("oil not found")
  return
end

oil.setup({})

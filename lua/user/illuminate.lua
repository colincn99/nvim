local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  print("illumniate not found")
  return
end

illuminate.configure({
  filetypes_denylist = {
          'NvimTree',
      },
})



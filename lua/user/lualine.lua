local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("lualine not found")
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {},
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {{'tabs', mode = 2, max_length = vim.o.columns}},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = {'mode'},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype', 'diff'},
    lualine_y = {'diagnostics'},
    lualine_z = {'vim.api.nvim_win_get_number(0)'}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype', 'diff'},
    lualine_y = {'diagnostics'},
    lualine_z = {'vim.api.nvim_win_get_number(0)'}
  },
  extensions = {}
}

vim.opt.showtabline = 2
vim.cmd[[set laststatus=0]]

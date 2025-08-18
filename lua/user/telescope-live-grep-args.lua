local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("telescope not found")
  return
end

local status_ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
if not status_ok then
  print("telescope-live-grep-args not found")
  return
end

telescope.setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}

local M = {}

M.config = function()
  local status_ok, gitlinker = pcall(require, "gitlinker")
  if not status_ok then
    return
  end
  lvim.builtin.which_key.mappings["gy"] = "Link"
  gitlinker.setup {
    opts = {
      callbacks = {
        ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url,
      },
      -- remote = 'github', -- force the use of a specific remote
      -- adds current line nr in the url for normal mode
      add_current_line_on_normal_mode = true,
      -- callbackfor what to do with the url
      action_callback = require("gitlinker.actions").open_in_browser,
      -- print the url after performing the action
      print_url = false,
      -- mapping to call url generation
      mappings = "<leader>gy",
    },
  }
end

return M

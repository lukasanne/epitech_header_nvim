local M = {}
local comment_styles = require("epitech-header.comment_styles")
local utils = require("epitech-header.utils")

local function get_comment_style(filetype)
  return comment_styles.styles[filetype] or comment_styles.styles.default
end

function M.generate_header()
  local filetype = vim.bo.filetype
  local style = get_comment_style(filetype)
  local year = os.date("%Y")

  -- Check if header already header_exists
  utils.remove_existing_header(style)

  -- Request project name
  vim.ui.input({ prompt = "Enter project name: " }, function(project_name)
    -- If user cancels, use current file name as project name
    if not project_name or project_name == "" then
      project_name = vim.fn.expand("%:t")
    end

    -- Request file description
    vim.ui.input({ prompt = "Enter file description: " }, function (file_description)
      -- If user cancels, use empty string as file description
      if not file_description then
        file_description = ""
      end

      -- Create header
      local header = string.format(
        "%s\n%s EPITECH PROJECT, %s\n%s %s\n%s File description:\n%s %s\n%s",
        style.start,
        style.mid,
        year,
        style.mid,
        project_name,
        style.mid,
        style.mid,
        file_description,
        style.end_
      )

      -- Insert the header at the beginning of the file
      vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))

      -- Clean UI and print notification
      vim.cmd("redraw")
      vim.notify("Header inserted successfully!", vim.log.levels.INFO)
    end)
  end)
end

return M


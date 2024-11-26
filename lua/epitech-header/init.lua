local M = {}
local comment_styles = require("epitech-header.comment_styles")
local utils = require("epitech-header.utils")

local function get_comment_style(filetype)
  -- Return the style based on filetype, defaulting to 'default' if not found
  local style = comment_styles.styles[filetype] or comment_styles.styles.default
  return style
end

local function create_header(style, year, project_name, file_description)
  return string.format(
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
end


function M.generate_header()
  local filetype = vim.bo.filetype
  local style = get_comment_style(filetype)
  local year = os.date("%Y")

  -- Check and remove existing header
  utils.remove_existing_header(style)

  -- Request project name and file description
  vim.ui.input({
    prompt = "Enter project name: ",
    default = vim.fn.expand("%:t")
  }, function(project_name)
    if not project_name or project_name == "" then
      vim.notify("No project name provided. Using current file name.", vim.log.levels.WARN)
      project_name = vim.fn.expand("%:t")
    end

    vim.ui.input({
      prompt = "Enter file description: ",
      default = ""
    }, function(file_description)
      local header = create_header(style, year, project_name, file_description)

      -- Insert the header at the beginning of the file
      vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))
      vim.cmd("redraw")  -- Clean UI
      vim.notify("Header inserted successfully!", vim.log.levels.INFO)
    end)
  end)
end

return M


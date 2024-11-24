local M = {}

local comment_styles = {
  c = { start = "/*", mid = "**", end_ = "*/" },
  cpp = { start = "/*", mid = "**", end_ = "*/" },
  python = { start = "#", mid = "#", end_ = "#" },
  lua = { start = "--", mid = "--", end_ = "--" },
  default = { start = "#", mid = "#", end_ = "#" }
}

local function get_comment_style(filetype)
  return comment_styles[filetype] or comment_styles.default
end

local function remove_existing_header(style)
  -- Get the first 6 lines of the file
  local lines = vim.api.nvim_buf_get_lines(0, 0, 6, false)

  -- Check if the second line contains "EPITECH PROJECT"
  if #lines >= 2 and lines[2]:find("EPITECH PROJECT", 1, true) then
    vim.api.nvim_buf_set_lines(0, 0, 6, false, {}) -- Delete first 6 lines
    vim.notify("Existing header removed.", vim.log.levels.INFO)
  end
end

function M.generate_header()
  local filetype = vim.bo.filetype
  local style = get_comment_style(filetype)
  local year = os.date("%Y")

  -- Check if header already header_exists
  remove_existing_header(style)

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


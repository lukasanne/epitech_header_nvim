local M = {}

function M.remove_existing_header(style)
  -- Get the first 6 lines of the file
  local lines = vim.api.nvim_buf_get_lines(0, 0, 6, false)

  -- Check if the second line contains "EPITECH PROJECT"
  if #lines >= 2 and lines[2]:find("EPITECH PROJECT", 1, true) then
    vim.api.nvim_buf_set_lines(0, 0, 6, false, {}) -- Delete first 6 lines
    vim.notify("Existing header removed.", vim.log.levels.INFO)
  end
end



return M

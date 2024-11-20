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

function M.generate_header()
  local filetype = vim.bo.filetype
  local style = get_comment_style(filetype)
  local year = os.date("%Y")

    local header = string.format(
        "%s\n%s EPITECH PROJECT, %s\n%s [project name]\n%s File description:\n%s [enter description here]\n%s",
        style.start,
        style.mid,
        year,
        style.mid,
        style.mid,
        style.mid,
        style.end_
    )

  vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))
  print("Header inserted successfully!")
end

return M

local M = {}

M.styles = {
  c = { start = "/*", mid = "**", end_ = "*/" },
  cpp = { start = "/*", mid = "**", end_ = "*/" },
  python = { start = "#", mid = "#", end_ = "#" },
  lua = { start = "--", mid = "--", end_ = "--" },
  default = { start = "#", mid = "#", end_ = "#" }
}

return M

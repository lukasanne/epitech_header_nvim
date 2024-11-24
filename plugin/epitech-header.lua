-- Create a command for command in Neovim
vim.api.nvim_create_user_command("EpitechHeader", function()
  require("epitech-header").generate_header()
end, {})

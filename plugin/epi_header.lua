-- Create a keymap for command in Neovim
vim.api.nvim_create_user_command("EpiHeader", function()
  require("epi_header").generate_header()
end, {})

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",  -- default if opened without a direction flag
  },
  keys = {
    { "<A-h>", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Terminal (horizontal)" },
    { "<A-v>", "<cmd>ToggleTerm direction=vertical size=80<CR>", desc = "Terminal (vertical)" },
  },
}

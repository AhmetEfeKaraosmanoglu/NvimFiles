return {
  "rebelot/kanagawa.nvim",
  lazy = false,       -- load immediately, not on-demand
  priority = 1000,    -- load before other plugins so it doesn't flash the default theme
  config = function()
    require("kanagawa").setup({
      compile = false,
      dimInactive = true,
    })
    vim.cmd("colorscheme kanagawa-dragon")
  end,
}

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
  },
  opts = {
    view = { width = 30 },
    renderer = { group_empty = true },
    filters = {
      dotfiles = false,
      git_ignored = false, -- <-- this was missing, hides build/ by default
    },
    git = {
      ignore = false, -- <-- belt-and-suspenders, some versions need this too
    },
  },
}

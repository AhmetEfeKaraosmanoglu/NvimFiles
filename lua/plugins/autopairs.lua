return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    map_cr = true, -- <CR> between a pair expands it onto its own indented line
  },
}

return {
  "saghen/blink.cmp",
  version = "*",             -- use the latest stable release
  opts = {
    keymap = { preset = "default" },  -- Tab/Enter to accept, Ctrl-n/p to navigate
    appearance = { nerd_font_variant = "mono" },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  },
}

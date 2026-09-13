return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "clangd" },  -- auto-installs clangd, no manual download needed
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- We never call require("lspconfig") anymore — this plugin is only here
    -- to supply its bundled lsp/clangd.lua defaults (cmd, root markers, etc.)
    -- which vim.lsp.config() merges with our overrides below.
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- Diagnostic display: signs in the gutter, underline the offending code,
      -- and show the full error/warning message on its own line, but only
      -- for whichever line your cursor is actually on (keeps it uncluttered).
      vim.diagnostic.config({
        underline = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN]  = "󰀪 ",
            [vim.diagnostic.severity.INFO]  = "󰋽 ",
            [vim.diagnostic.severity.HINT]  = "󰌶 ",
          },
        },
        virtual_text = false,
        virtual_lines = { current_line = true },
      })


      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
  "clangd",
  "--background-index",
  "--clang-tidy",
  "--header-insertion=iwyu",
  "--completion-style=detailed",
},        settings = {
          clangd = {
            InlayHints = {
              Enabled = true,
              ParameterNames = true,
              DeducedTypes = true,
              Designators = true,
            },
            fallbackFlags = { "-std=c++20" },
          },
        },
      })

      vim.lsp.enable("clangd")

      -- Turn on Neovim's native inlay hint rendering once the LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
          buffer = args.buf,
          desc = "Code action",
          })
        end,
      })
      -- Pop up the full diagnostic automatically when the cursor rests on it
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
        end,
      })
    end,
  },
}

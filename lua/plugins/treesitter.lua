return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- Install the parsers you need
    require("nvim-treesitter").install({ "c", "cpp", "lua", "vim", "vimdoc", "bash" })

    -- Turn on highlighting/indenting for those filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "lua", "vim", "bash" },
      callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

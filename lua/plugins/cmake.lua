return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
  opts = {
    cmake_dap_configuration = {
      name = "cpp",
      type = "codelldb",
      request = "launch",
    },
  },
}

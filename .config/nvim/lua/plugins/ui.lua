return {
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    name = "nord",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          function()
            return string.format("%s", vim.bo.filetype):upper()
          end,
        },
      },
    },
  },
}

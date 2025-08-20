return {
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    config = function()
      require("neopywal").setup({
        use_wallust = false,
        transparent_background = true,
        plugins = {
          fzf = true,
          harpoon = true,
          leap = {
            enabled = true,
            style = { "bold", "italic" },
          },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        highlights = require("neopywal.theme.plugins.bufferline").setup(),
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    config = function()
      local has_lualine, lualine = pcall(require, "lualine")
      if not has_lualine then
        return
      end

      local has_neopywal, neopywal_lualine = pcall(require, "neopywal.theme.plugins.lualine")
      if not has_neopywal then
        return
      end

      neopywal_lualine.setup()

      lualine.setup({
        options = {
          theme = "neopywal",
        },
      })
    end,
  },
}

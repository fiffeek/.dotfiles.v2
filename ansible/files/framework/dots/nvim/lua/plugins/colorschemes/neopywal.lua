return {
  "RedsXDD/neopywal.nvim",
  name = "neopywal",
  lazy = false,
  priority = 1000,
  config = function()
    require("neopywal").setup({
      use_wallust = false,
      transparent_background = true,
    })
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "python",
        "toml",
        "tsx",
        "typescript",
        "yaml",
        "jsonc",
        "json5",
      })
    end
    opts.indent = {
      enable = true,
      disable = { "python", "yaml" },
    }
  end,
}

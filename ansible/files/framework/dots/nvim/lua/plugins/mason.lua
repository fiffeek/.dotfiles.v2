return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "prettierd",
      "shfmt",
      "shellcheck",
      "black",
      "isort",
      "bzl",
      "clangd",
      "jinja-lsp",
    },
  },
}

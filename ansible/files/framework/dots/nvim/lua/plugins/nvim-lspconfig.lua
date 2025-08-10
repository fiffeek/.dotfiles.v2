return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jinja_lsp = {
        filetypes = { "jinja" },
        root_markers = { ".git" },
        init_options = {
          templates = "./templates",
          backend = { "./venv/lib/python3.9/site-packages/jinja2" },
          lang = "python",
        },
      },
      pyright = {},
      ansiblels = {},
      marksman = {},
      cssls = {
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },
      html = {},
      yamlls = {
        settings = {
          yaml = {
            customTags = {
              "!reference sequence", -- necessary for gitlab-ci.yaml files
            },
          },
        },
      },
    },
  },
}

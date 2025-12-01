return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ocamllsp = {
        cmd = { "ocamllsp" },
        settings = {
          codelens = { enable = true },
          inlayHints = { enable = true },
          syntaxDocumentation = { enable = true },
        },
        server_capabilities = { semanticTokensProvider = false },
      },
      gopls = {
        settings = {
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules", "-venv" },
        },
      },
      jinja_lsp = {
        filetypes = { "jinja" },
        root_markers = { ".git" },
        init_options = {
          templates = "./templates",
          backend = { "./venv/lib/python3.9/site-packages/jinja2" },
          lang = "python",
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
            },
          },
        },
      },
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

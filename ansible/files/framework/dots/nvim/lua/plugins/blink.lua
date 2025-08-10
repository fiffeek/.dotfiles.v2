local function buf_is_big(bufnr)
  local max_filesize = 100 * 1024 -- 100 KB
  local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))

  if ok and stats and stats.size > max_filesize then
    return true
  end

  return false
end

return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        lsp = { fallbacks = {} },
        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          min_keyword_length = 2,
          score_offset = 2,
          opts = {
            -- default to all visible buffers
            get_bufnrs = function()
              return vim
                .iter(vim.api.nvim_list_bufs())
                :filter(function(buf)
                  return vim.bo[buf].buftype ~= "nofile" or buf_is_big(buf)
                end)
                :totable()
            end,
          },
        },
      },
    },
  },
}

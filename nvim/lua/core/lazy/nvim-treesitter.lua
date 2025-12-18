return {
  -- requires tree-sitter-cli
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  config = function()
    require("nvim-treesitter").install {
      "bash",
      "go",
      "gomod",
      "gosum",
      "java",
      "javascript",
      "lua",
      "make",
      "python",
      "scala",
      "vim",
      "vimdoc"
    }

    local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      desc = "Enable TreeSitter highlighting",
      callback = function(ev)
        local ft = ev.match
        local buf = ev.buf

        -- Skip large files (>100KB)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return
        end

        local lang = vim.treesitter.language.get_lang(ft) or ft
        pcall(vim.treesitter.start, buf, lang)
      end,
    })
  end
}

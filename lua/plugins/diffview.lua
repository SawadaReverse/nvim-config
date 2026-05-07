return {
  "sindrets/diffview.nvim",
  opts = {
    default_args = {
      DiffviewOpen = { "-w" },
    },
    hooks = {
      diff_buf_read = function()
        vim.cmd("normal! zR")
      end,
      diff_buf_win_enter = function()
        -- DiffChange と DiffText を強調（行背景＋文字に強い色）
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1a3a5a" })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#a06000", fg = "#ffffff", bold = true })
      end,
    },
  },
}

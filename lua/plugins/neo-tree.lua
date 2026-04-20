return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    -- git 変更ファイルを黄色で表示
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#e0af68" })
        end,
      },
    },
  },
}

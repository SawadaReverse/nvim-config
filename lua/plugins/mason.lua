return {
  -- 全 LSP サーバーで Mason を無効化し、PATH 上のバイナリを使う
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      for _, server_opts in pairs(opts.servers) do
        if type(server_opts) == "table" then
          server_opts.mason = false
        end
      end
    end,
  },
  -- Mason の自動インストールを無効化
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },
}

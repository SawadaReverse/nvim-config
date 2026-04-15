return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>gq",
      function()
        require("telescope.pickers")
          .new({}, {
            prompt_title = "Ghq Repositories",
            finder = require("telescope.finders").new_oneshot_job({ "ghq", "list", "--full-path" }),
            sorter = require("telescope.config").values.generic_sorter({}),
            attach_mappings = function(prompt_bufnr)
              require("telescope.actions").select_default:replace(function()
                local entry = require("telescope.actions.state").get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)
                vim.cmd("cd " .. entry[1])
                vim.notify("Switched to " .. entry[1])
              end)
              return true
            end,
          })
          :find()
      end,
      desc = "Ghq repositories",
    },
  },
}

return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      timeout = 10000,
      filter = function(notif)
        if notif.msg:match("Skipping wait for gitignored") then
          return false
        end
        return true
      end,
    },
  },
}

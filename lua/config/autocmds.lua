-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- cmux等のペイン分割ではFocusGainedが発火しないため、
-- CursorHold/BufEnterでもchecktimeを実行して外部変更を検知する
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("external_file_reload", { clear = true }),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

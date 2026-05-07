-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 現在行の blame コミットをブラウザで開く
vim.keymap.set("n", "<leader>gB", function()
  local blame = vim.fn.system("git blame -L " .. vim.fn.line(".") .. "," .. vim.fn.line(".") .. " --porcelain " .. vim.fn.expand("%"))
  local hash = blame:match("^(%x+)")
  if hash and not hash:match("^0+$") then
    local repo_url = vim.fn.system("gh browse -n"):gsub("%s+$", "")
    vim.ui.open(repo_url .. "/commit/" .. hash)
  else
    vim.notify("No commit found for this line", vim.log.levels.WARN)
  end
end, { desc = "Open blame commit in browser" })

-- ウィンドウリサイズの連打対応 (<C-w> < > + - を1度押せば、その後 <>+- や hjkl で連続リサイズ)
local function resize_loop(initial)
  local function apply(key)
    if key == "<" or key == "h" then
      vim.cmd("vertical resize -2")
    elseif key == ">" or key == "l" then
      vim.cmd("vertical resize +2")
    elseif key == "-" or key == "j" then
      vim.cmd("resize -2")
    elseif key == "+" or key == "k" then
      vim.cmd("resize +2")
    else
      return false
    end
    vim.cmd("redraw")
    return true
  end
  apply(initial)
  while true do
    local key = vim.fn.nr2char(vim.fn.getchar())
    if not apply(key) then
      break
    end
  end
end

vim.keymap.set("n", "<C-w><", function() resize_loop("<") end, { desc = "Resize -width (repeat)" })
vim.keymap.set("n", "<C-w>>", function() resize_loop(">") end, { desc = "Resize +width (repeat)" })
vim.keymap.set("n", "<C-w>-", function() resize_loop("-") end, { desc = "Resize -height (repeat)" })
vim.keymap.set("n", "<C-w>+", function() resize_loop("+") end, { desc = "Resize +height (repeat)" })

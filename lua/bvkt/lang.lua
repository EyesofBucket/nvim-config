vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.nix", "*.yaml", "*.yml", "*.json"},
  callback = function() vim.opt.shiftwidth = 2 end,
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.md"},
  callback = function() vim.cmd("setlocal spell") end,
})

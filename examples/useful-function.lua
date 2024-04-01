local function center_comment_any()
  -- Get the next key pressed
  local next_keypress = vim.fn.getcharstr()

  -- Include the next key as the center comment character
  vim.cmd(string.format([[:CenterComment %s]], next_keypress))
end

vim.opt.keymap("n", "<leader>cc", center_comment_any)

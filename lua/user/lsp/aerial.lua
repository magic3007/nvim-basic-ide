local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end

-- Shorten function name
local keymap = vim.keymap.set

aerial.setup {
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    keymap('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    keymap('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
}

keymap('n', '<leader>a', '<cmd>AerialToggle!<CR>')


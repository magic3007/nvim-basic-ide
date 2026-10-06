-- The plugin set is pinned to 2022 commits (see lua/user/plugins.lua for why).
-- Those plugins call a few helpers Neovim 0.12 deprecates, which printed a
-- warning on every start. Re-provide them with identical behaviour, minus the
-- notice — kept defined even once Neovim removes the deprecated originals, so
-- the pinned plugins keep working across the upgrade.
if vim.tbl_keys then
  vim.tbl_add_reverse_lookup = function(o)
    for _, k in ipairs(vim.tbl_keys(o)) do
      local v = o[k]
      if o[v] then
        error(
          string.format(
            'The reverse lookup found an existing value for %q while processing key %q',
            tostring(v),
            tostring(k)
          )
        )
      end
      o[v] = k
    end
    return o
  end
end

-- vim.islist is the non-deprecated spelling of vim.tbl_islist
if vim.islist then
  vim.tbl_islist = vim.islist
end

-- Used by the pinned nvim-treesitter during setup; vim.iter(…):flatten() is the
-- non-deprecated replacement. Defined unconditionally: guarded by
-- "if vim.tbl_flatten" this shim would stop being installed the moment Neovim
-- drops the deprecated function, and the plugin call would then fail.
vim.tbl_flatten = function(t)
  local result = {}
  local function flatten(v)
    for i = 1, #v do
      local item = v[i]
      if type(item) == 'table' then
        flatten(item)
      elseif item then
        table.insert(result, item)
      end
    end
  end
  flatten(t)
  return result
end

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.autocommands")
require("user.colorscheme")
require("user.cmp"   )
require("user.telescope")
require("user.gitsigns")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.illuminate")
require("user.indentline")
require("user.alpha")
require("user.lsp")
require("user.dap")
require("user.hologram")
require("user.auto-save")

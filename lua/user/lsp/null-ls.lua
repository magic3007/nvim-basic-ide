local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = true,
  sources = {
    -- formatting
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.clang_format.with {
      extra_args = { "-style=file" }
    }, -- c/c++ formatter
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua, -- lua formatter
    formatting.google_java_format,
    formatting.shfmt, -- shell formatter

    -- diagnostics
    -- diagnostics.cspell, -- spell check
    diagnostics.flake8, -- python linter
    diagnostics.shellcheck, -- shell linter 

    -- code actions 
    code_actions.cspell, -- spell check
    code_actions.gitsigns,
    code_actions.shellcheck, -- shell script code actions

    -- hover dictionary

  },
}

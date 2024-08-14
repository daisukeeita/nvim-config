local opt = vim.opt

opt.clipboard = "unnamedplus"

-- UI CONFIGURATION --
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.termguicolors = true
opt.updatetime = 250

opt.number = true
opt.relativenumber = true

-- DIAGNOSTIC CONFIGURATIONS --
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰌶 ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  float = {
    scope = "cursor",
    border = "rounded",
    focusable = true,
    style = "minimal",
    source = "if_many",
    prefix = "󱅶 ",
  },
})

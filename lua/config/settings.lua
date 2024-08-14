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

-- OPEN HELP WINDOW IN A VERTICAL SPLIT TO THE RIGHT --
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_right", {}),
  pattern = { "*.txt" },
  callback = function()
    if vim.o.filetype == "help" then
      vim.cmd.wincmd("L")
    end
  end,
})

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
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

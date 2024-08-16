----------------------------------------------------
---------          COLORSCHEME UI          ---------
----------------------------------------------------
local status_ok, color_scheme = pcall(require, "catppuccin")
if not status_ok then
  return
end

require("catppuccin").setup({
  flavour = auto,
  background = {
    light = latte,
    dark = mocha,
  },
  transparent_background = true,
  term_colors = true,
  style = {
    conditionals = { "italic" },
    variables = { "italic" },
    functions = { "bold", "italic" },
  },
  integrations = {
    alpha = true,
    notify = true,
    mason = true,
    noice = true,
  },
})

---------------------------------------------------------
--------                INDENT UI                --------
---------------------------------------------------------
require("mini.indentscope").setup({
  symbol = "╏",
})

---------------------------------------------------------
--------              STATUSLINE UI              --------
---------------------------------------------------------
local getAttachedLSP = function()
  local msg = "No Active LSP"
  local LspClient = vim.lsp.get_clients()
  local currentBufferType = vim.api.nvim_get_option_value("filetype", { buf = 0 })

  if next(LspClient) == nil then
    return msg
  end

  for _, client in ipairs(LspClient) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, currentBufferType) ~= 1 then
      return client.name
    end
  end

  return msg
end

require("lualine").setup({
  options = {
    theme = "catppuccin",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      {
        "fileformat",
        separator = { left = "", right = "█" },
        right_padding = 2,
      },
    },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      "filename",
    },
    lualine_x = {
      { getAttachedLSP, icon = " LSP:" },
      "encoding",
      "filetype",
    },
    lualine_z = { { "location", separator = { right = "", left = "" }, left_padding = 2 } },
  },
})

---------------------------------------------------------
--------            COMMAND LINE UI              --------
---------------------------------------------------------
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  views = {
    popupmenu = {
      enabled = true,
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
})

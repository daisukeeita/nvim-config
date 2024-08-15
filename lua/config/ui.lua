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

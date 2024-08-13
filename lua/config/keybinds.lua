local keymap = vim.keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = ' ' 
vim.g.maplocalleader = ','


 -- MASON KEYMAP --
keymap.set('n', '<leader>M', ':Mason<CR>', opts)

 -- FORMATTER KEYMAP --
keymap.set( 'n', '<leader>cF', function() require('conform').format({ async = true }) end, opts )

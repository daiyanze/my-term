local g = vim.g

-- Visual Multi
-- Exit VM silently
g.VM_silent_exit = 1

-- Override statusline color
vim.cmd 'hi Tabline term=bold     cterm=bold    ctermbg=NONE    ctermfg=NONE    guibg=#323232    guifg=NONE    gui=NONE'

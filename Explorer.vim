""" Explorer
""" Bruce Scheibe
""" Manage and display a diretory listing as normally seen in many IDEs using Netrw.


" Set up a few Netrw settings to allow for the behavior we want.
let g:netrw_banner=0
let g:netrw_winsize=15
let g:netrw_altv=2
let g:netrw_preview=1


" Macro for toggling the explorer through the keyboard.
map - :call ToggleExplorer() <CR>



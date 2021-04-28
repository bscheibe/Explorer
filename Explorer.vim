""" Explorer
""" Bruce Scheibe
""" Manage and display a diretory listing as normally seen in many IDEs using Netrw.


" Set up a few Netrw settings to allow for the behavior we want.
let g:netrw_banner=0
let g:netrw_winsize=15
let g:netrw_altv=2
let g:netrw_preview=1
let g:netrw_bufsettings='wrap nonu'


" Macro for toggling the explorer through the keyboard.
map - :call ToggleExplorer() <CR>


" Configure based on our current environment.
if has("gui_running")
        let g:netrw_browse_split=3
        let g:netrw_liststyle=3
        set mouse=n " May not need this.
        au FileType netrw nmap <buffer> <LeftMouse> <LeftMouse> <CR>
        au FileType netrw map <buffer> - :call ToggleExplorer() <CR>
        nmap <buffer> <LeftMouse> <LeftMouse> <CR> " Testing
        amenu Explorer.Toggle\ Explorer\ \ \ \ \ - :call ToggleExplorer() <CR>
else
        let g:netrw_browse_split=4
        let g:netrw_liststyle=4
        " Refresh the directory listing when changing buffers.
        autocmd BufWinEnter * call UpdateExplorer()
endif


let t:explorer_shown=0
function! ToggleExplorer()
        if t:explorer_shown
                " Assumes the top-left-most window is the explorer
                wincmd t
                :q
        else
                Vex
                wincmd w
        endif
        let t:explorer_shown=!t:explorer_shown
endfunction


function! UpdateExplorer()
        if t:explorer_shown
                let t:dir=expand('%:p:h') " Retrieve the directory of the focused buffer
                wincmd t
                execute "E ". t:dir
                wincmd w
        endif
endfunction

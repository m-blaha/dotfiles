set expandtab
set foldlevelstart=99
set foldmethod=syntax
set ignorecase
set incsearch
set pastetoggle=<F5>
set shiftwidth=4
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set title
set titlestring=vim\ %F%m
set laststatus=2
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

filetype plugin indent on

autocmd     BufRead     *.py    set foldmethod=indent

cnoreabbrev W w
cnoreabbrev Wq wq

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"nnoremap <space> za
"vnoremap <space> zf
nnoremap <C-L> gt
nnoremap <C-H> gT


" Otevre file dialog pro novy tab v aktualnim adresari
function! OpenTabDialog()
    "execute "set browsedir=" . expand('%:h')
    execute "browse tabedit " . expand('%:p:h')
endfunction
command -nargs=0 OT call OpenTabDialog()


" Odstrani bordel z koncu radku
" :RS<CR>
function! RStrip()
   let save_cursor = getpos(".")
    try
        exec "%s/\\s\\+\$//g"
    catch /E486/
        return
    endtry
   call setpos('.', save_cursor)
endfunction
command -nargs=0 RS call RStrip()

" Predela ulozeny select z postgresu na normalni csv
" :PF<CR>
function! PFormat()
    let save_cursor = getpos(".")
    exec "%s/^ //e"
    exec "%s/ \\+/ /ge"
    exec "%s/ | /|/ge"
    call setpos('.', save_cursor)
endfunction
command -nargs=0 PF call PFormat()

call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer' }
call plug#end()

" YCM
let g:ycm_confirm_extra_conf = 0

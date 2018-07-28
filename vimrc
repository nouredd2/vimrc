set number
set shiftwidth=8
set tabstop=8
set expandtab

filetype plugin on 
syntax on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

filetype indent on 

" vundle options
set nocompatible
filetype off

" for making lightline work and show the cool status bar
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'chazy/cscope_maps'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'fatih/vim-go'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/goyo.vim'


call vundle#end()
filetype plugin indent on 


" PEP8 indentation for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

" turn on spell checking when editing .tex files
au BufNewFile,BufRead *.tex
    \ set spell spelllang=en_us |
    \ set textwidth=120

" map c-q to :ccl to close the quickfix view
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>b <Plug>(go-build)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>q :pc<CR>

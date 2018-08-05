"" basic settings
set number
set smartindent
set shiftwidth=8
set tabstop=8
set expandtab

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" to remove highlights
nnoremap <leader><space> :noh<cr>

filetype plugin on 
syntax on

"" latex-suite options 

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

filetype indent on

" for lightline to produce the cool bar
set laststatus=2


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" For MacOS, change the viewer to use the default open command
" let g:Tex_ViewRule_pdf = 'open -g'
" let g:Tex_ViewRule_ps = 'open -a Preview -g'
" let g:Tex_TreatMacViewerAsUNIX = 1


" latex-suite customization
let g:Tex_DefaultTargetFormat='pdf'

" latex-suite multiple compilation
let g:Tex_MultipleCompileFormats='pdf,dvi'

"" End of latex-suite options 


"" vundle options to set up the package manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" simply fold
Plugin 'tmhedberg/SimpylFold'

" for Python indentation
Plugin 'vim-scripts/indentpython.vim'

" linux kernel style formatting
Plugin 'vivien/vim-linux-coding-style'

" for go development
" Plugin 'fatih/vim-go'

" cscope maps
Plugin 'chazy/cscope_maps'

" cool status bar
Plugin 'itchyny/lightline.vim'

" distraction free writing
Plugin 'junegunn/goyo.vim'

" support for github markdown
Plugin 'gabrielelana/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Edit the way C/C++ indentation works according
" to a chose style. I am following the style guidelines
" used in ns-3 just because I liked them
" au BufNewFile,BufRead *.c,*.cc,*.h,*.cpp
"       \ set shiftwidth=2 |
"       \ set tabstop=2 |
"       \ set expandtab |
"       \ set nosmartindent |
"       \ set autoindent |
"       \ set cindent |
"       \ set cino=>2sN-2s{1sf-sg0^-1se-2

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
	  \ set textwidth=100

" turn on spell checking and limit linewidth when editing .md files
au BufNewFile,BufRead *.md
    \ set spell spelllang=en_us |
    \ set textwidth=120

" custom latex command to insert comments at the start of each line
command! -range TexComment <line1>,<line2> s/^/%

" map c-q to :ccl to close the quickfix view
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>b <Plug>(go-build)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>q :pc<CR>

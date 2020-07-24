"" basic settings
set number
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" fix split to go to the bottom and the right
set splitright
set splitbelow

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
let g:Tex_ViewRule_pdf = 'open -g'
let g:Tex_ViewRule_ps = 'open -a Preview -g'
let g:Tex_TreatMacViewerAsUNIX = 1


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

" vim latexsuite
Plugin 'vim-latex/vim-latex'

" simply fold
Plugin 'tmhedberg/SimpylFold'

" for Python indentation
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'Vimjas/vim-python-pep8-indent'

" linux kernel style formatting
Plugin 'vivien/vim-linux-coding-style'

" for go development
" Plugin 'fatih/vim-go'

" cscope maps
Plugin 'chazy/cscope_maps'

" cool status bar
Plugin 'itchyny/lightline.vim'

" support for github markdown
Plugin 'gabrielelana/vim-markdown'

" dracula colorscheme
Plugin 'flazz/vim-colorschemes'

" vim plugin for tmux source files editing
Plugin 'tmux-plugins/vim-tmux'

" plugin for commenting out lines
Plugin 'tpope/vim-commentary'

" nerd tree
Plugin 'scrooloose/nerdtree'

" toms
Plugin 'cespare/vim-toml'

" vim surron
Plugin 'tpope/vim-surround'

" distraction free writing
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'

" better vim greo
Plugin 'mhinz/vim-grepper'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" fix omnifunc for python
filetype plugin on 
set omnifunc=syntaxcomplete#Complete

" Use vim-markdown instead of polyglot's one
" Same for latex suite
" let g:polyglot_disabled = ['markdown', 'latex', 'C']

" edit some markdown options
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" Edit the way C/C++ indentation works according
" to a chose style. I am following the style guidelines
" used in ns-3 just because I liked them
"au BufNewFile,BufRead *.c,*.cc,*.h,*.cpp
"      \ set shiftwidth=2 |
"      \ set tabstop=2 |
"      \ set expandtab |
"      \ set nosmartindent |
"      \ set autoindent |
"      \ set cindent |
"      \ set cino=>2sN-2s{1sf-sg0^-1se-2

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
	  \ set textwidth=80 |
      \ syntax spell toplevel

" turn on spell checking and limit linewidth when editing .md files
au BufNewFile,BufRead *.md
    \ set spell spelllang=en_us |
    \ set textwidth=100

" set the textwidth for go programs
au BufNewFile,BufRead *.go
    \ set textwidth=100

" custom latex command to insert comments at the start of each line
command! -range TexComment <line1>,<line2> s/^/%

" for easy manipulation of the error windows
" reenable these for go development
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>d <Plug>(go-doc)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprev<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>q :pc<CR>

" easy compilation mapping in latex document
autocmd FileType tex map <leader>c :!make<CR><CR>
autocmd FileType tex map <leader>v :!make view<CR><CR>

" change the colorscheme
colorscheme late_evening

" toggle the nerdtree
map <leader>z :NERDTreeToggle<CR>

" limelight config
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

" Goyo config
let g:goyo_width = 120
let g:goyo_linenr = 1


"" various easy mappings

"jk for normal model when in edit
inoremap jk <ESC>

" remove arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

let python_highlight_all = 1

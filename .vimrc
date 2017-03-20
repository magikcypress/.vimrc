"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
"  " required! 
Bundle 'vundle'

" My Bundles here:
"
" original repos on github
Bundle 'vim-fugitive'
Bundle 'vim-easymotion'
Bundle 'sparkup', {'rtp': 'vim/'}
Bundle 'FuzzyFinder'
Bundle 'vim-powerline'

"""""""""""""""""""" GLOBAL
let mapleader=","
let maplocalleader=";"
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set gfn=terminus
""set go=

call pathogen#infect()
if has("syntax")
  syntax on
endif
filetype plugin indent on     " required! 

""set term=screen-256color
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
""set bomb
set fileencodings=utf-8
set enc=utf-8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set fillchars+=stl:\ ,stlnc:\
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.o,*~,*.pyc
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set omnifunc=pythoncomplete#Complete
set pastetoggle=<F2>
set cul " highlight current line
set cursorline
hi CursorLine term=none cterm=none ctermbg=237  " adjust color

"""""""""""""""""""" KEYBINDINGS

map cc <leader>c<space>
map  # {v}! par 80<CR>
map  & {v}! par 80j<CR>
map  [ {v}! par 122<CR>
map  ] {v}! par 122j<CR>
map  <F6> :setlocal spell! spelllang=en<CR>
map <leader>c :w<CR>:!aspell -c %<CR>:e %<CR>
map <silent> <F3> "<Esc>:match ErrorMsg '\%>80v.\+'<CR>"
map  <F12> :set invhls<CR>
map <F5> `
map <F4> :'a,'bd<cr>
nmap <LocalLeader>tl :set list!<cr>
nmap <LocalLeader>pp :set paste!<cr>
nmap  <F8> :Dpaste<CR>
cmap <C-g> <C-u><ESC>
vmap > >gv
vmap < <gv
vmap g :<C-U>!/opt/firefox/firefox "http://encrypted.google.com/search?q=<cword>" >& /dev/null<CR><CR>
vmap c :<C-U>!/opt/firefox/firefox "http://www.duckduckgo.com/?q=<cword>" >& /dev/null<CR><CR>
command! -bang W w<bang>
" Fast saving
nmap <leader>w :w!<cr>
" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"""""""""""""""""""" PLUGINS

set guifont=Monaco\ for\ Powerline\ 10
let g:Powerline_symbols = 'fancy'
let g:CommandTMaxFiles=5000
let g:CommandTMaxHeight=22
map <C-o> :CommandT<CR>
map <C-p> :CommandTBuffer<CR>
let g:CommandTAcceptSelectionMap = '<CR>'
let g:CommandTCancelMap = '<C-g>'

let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '.html*', '\.php*', '\.cpp$', '\.h$', '*']
nmap <c-b> :NERDTreeToggle<cr>
nmap <C-n> <c-w><left><down><c-w><c-w>
nmap <C-p> <c-w><left><up><c-w><c-w>
nmap <C-o> <c-w><left><CR>

"""""""""""""""""""" FILES SPECIFIC

au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au bufNewFile *.html 0r ~/.vim/templates/html.txt
au bufNewFile *.sh 0r ~/.vim/templates/sh.txt
au bufNewFile *.py 0r ~/.vim/templates/py.txt

autocmd filetype php,python,css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd filetype html,xhtml,xml set listchars-=tab:>.
autocmd filetype css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd filetype javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1


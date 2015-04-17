"""""""""""""""""""" PLUGINS filetype off " required!

if has("gui_running")
        set term=xterm
endif
set term=screen-256color

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'vundle'

" My Bundles here:
"
" original repos on github
Bundle 'vim-fugitive'
Bundle 'vim-easymotion'
Bundle 'sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-powerline'
" non github repos
Bundle 'Command-T'

"""""""""""""""""""" GLOBAL
let mapleader=","
let maplocalleader=";"
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set gfn=terminus
set go=

call pathogen#infect()
if has("syntax")
  syntax on
endif
filetype plugin indent on     " required! 

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set bomb
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
set mouse=
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set expandtab
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab 
set ruler
set omnifunc=pythoncomplete#Complete
set pastetoggle=<F2>
set cul " highlight current line
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
map  <F8> :Dpaste<CR>
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
" nmap <C-n> <c-w><left><down><c-w><c-w>
" nmap <C-p> <c-w><left><up><c-w><c-w>
" nmap <C-o> <c-w><left><CR>

"""""""""""""""""""" ORGMODE
" VimOrganizer
let g:ft_ignore_pat = '\.org'
let g:org_todo_setup='TODO | DONE'
let g:org_tags_alist='{@home(h) @work(w) @elec(t)} {easy(e) hard(d)} {computer(c) phone(p)}'
" and then put these lines in vimrc somewhere after the line above
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

let g:org_agenda_select_dirs=["~/org_files"]
let g:org_agenda_files = split(glob("~/org_files/agenda.org"),"\n")

" OrgCustomColors() allows a user to set highlighting for particular items
function! OrgCustomColors()
    " Various text item 'highlightings' below
    " are the defaults. Uncomment and change a line if you
    " want different highlighting for the element.
    "
    " Below are defaults for any TODOS you define. TODOS that
    " come before the | in a definition will use 'NOTDONETODO'
    " and those that come after are DONETODO
    hi! DONETODO guifg=green ctermfg=green
    hi! NOTDONETODO guifg=red ctermfg=lightred

    " Dates are date specs between angle brackets (<>) or square brackets ([])
    hi! Org_Date guifg=magenta ctermfg=magenta gui=underline cterm=underline

    " Org_Star is used to "hide" initial asterisks in a heading
    hi! Org_Star guifg=#444444 ctermfg=darkgray

    " Applies to the Heading line that can be displayed in column view
    highlight OrgColumnHeadings guibg=#444444 guifg=#aaaaaa gui=underline

    " Use g:org_todo_custom_highlights to set up highlighting for individual
    " TODO items. Without this all todos that designate an unfinished state
    " will be highlighted using NOTDONETODO highlight (see above)
    " and all todos that designate a finished state will be highlighted using
    " the DONETODO highlight (see above).
    let g:org_todo_custom_highlights =
               \ { 'TODO': { 'guifg':'#CCCCCC', 'guibg':'red'},
               \ 'DONE': { 'guifg':'#aa3388', 'ctermfg':'red' } }

endfunction

"""""""""""""""""""" FILES SPECIFIC

au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au bufNewFile *.html 0r ~/.vim/templates/html.txt
au bufNewFile *.sh 0r ~/.vim/templates/sh.txt
au bufNewFile *.py 0r ~/.vim/templates/py.txt
au bufNewFile *.rs 0r ~/.vim/templates/rs.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml


autocmd filetype php,python,css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd filetype html,xhtml,xml set listchars-=tab:>.
autocmd filetype css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd filetype javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

"""""""""""""""""""" TIDY

setlocal makeprg=tidy\ -quiet\ -errors\ %
setlocal errorformat=line\ %l\ column\ %v\ -\ %m
command Txml set ft=xml | execute "%!tidy -q -i -xml"
command Thtml set ft=html | execute "%!tidy -q -i -html"

"""""""""""""""""""" TwitVim settings

let twitvim_login = ""
let twitvim_proxy = "127.0.0.1:9999"
let twitvim_enable_perl = 1
let twitvim_browser_cmd = 'firefox'
nmap <leader>tw :FriendsTwitter<cr>
nmap <leader>tm :UserTwitter<cr>
nmap <leader>tM :MentionsTwitter<cr>
function! TwitVimMappings()
    nmap <buffer> U :exe ":UnfollowTwitter " . expand("<cword>")<cr>
    nmap <buffer> F :exe ":FollowTwitter " . expand("<cword>")<cr>
    nmap <buffer> 7 :BackTwitter<cr>
    nmap <buffer> 8 :ForwardTwitter<cr>
    nmap <buffer> 1 :PreviousTwitter<cr>
    nmap <buffer> 2 :NextTwitter<cr>
    nmap <buffer> ,sf :SearchTwitter #love OR #hate<cr>
    nmap <buffer> ,sd :SearchTwitter #python OR #django<cr>
    nmap <buffer> ,ss :SearchTwitter #caca<cr>
    nmap <buffer> ,sa :SearchTwitter #archlinux<cr>
    nmap <buffer> ,sv :SearchTwitter #vim<cr>
endfunction
augroup cyp_twitvim
    au!
    au FileType twitvim call TwitVimMappings()
augroup END

set runtimepath=~/.vim/powerline,$VIMRUNTIME

"""""""""""""""""""" ORIGINAL UBUNTU CONFIG

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible


" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

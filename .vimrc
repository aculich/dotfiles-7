"======================================== Platform Settings ====================================

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set runtimepath^=~/Dropbox/Tools/Vim/.vim
set directory^=~/

if has('unix')
    " set guifont=Consolas\ 10
    " set guifont=Envy\ Code\ R\ for\ Powerline\ 10
else "has('win32') || has('win64')
    set guifont=Consolas:h10
    set guifont=Envy_Code_R:h10
    set guifont=Envy_Code_R_for_Powerline:h10

    " Maximize window on startup
    au GUIEnter * simalt ~x

endif

set guifontwide=NSimsun:h12

"======================================== Vundle Settings ========================================

" https://github.com/gmarik/Vundle.vim " Required for Windows (https://github.com/gmarik/vundle/wiki/Vundle-for-Windows) " * Git and Curl (http://code.google.com/p/msysgit/) " * HTTPS_PROXY is set on a corporate Windows machine filetype off " Point Vundle to ~, same as $USERPROFILE and $HOME in Windows
set rtp+=~/Dropbox/Tools/Vim/.vim/bundle/Vundle.vim/
" call vundle#rc('~/Dropbox/Tools/Vim/.vim/bundle')
call vundle#begin('~/Dropbox/Tools/Vim/.vim/bundle')

" Vundle managed by Vundle itself 'https://github.com/gmarik/vundle.git'
Plugin 'gmarik/Vundle.vim'

"GIT REPOS
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
" Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/matchit'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
" Plugin 'fidian/hexmode'
Plugin 'scrooloose/syntastic'

"Handlebars 
Plugin 'mustache/vim-mustache-handlebars'

"Markdown 
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" GoLang
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'jstemmer/gotags'

" SnipMate
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'

" UltiSnips
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" Syntax
Plugin 'vim-scripts/actionscript.vim--Leider'
Plugin 'vim-scripts/aspnetcs'
Plugin 'groenewege/vim-less'

" Colors
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
" Plugin 'chankaward/vim-railscasts-theme'

" Tools
Plugin 'duncansmart/less.js-windows'

call vundle#end()

"======================================== Global Settings ======================================

"FILE
filetype plugin indent on
set nobackup
set hidden      " allow editing new buffers while unsaved changes remain

"Always set fileformats to unix
set fileformats=unix,dos
" set fileformats=unix

if has('multi_byte')
  if &termencoding == ''
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bombvim-railscasts-theme
  set fileencodings=ucs-bom,utf-8,latin1
endif

"COLORS
set background=dark
colorscheme molokai
" colorscheme badwolf

highlight Search guifg=black guibg=yellowgreen gui=bold
highlight LineNr guibg=#111111
highlight Normal guibg=#000000
highlight CursorLine guibg=#101010

" highlight Directory guifg=#A6E22E gui=bold

"SEARCH
set hlsearch    " highlight all search results
set ignorecase  " ignore search case
set smartcase   " case sensitive search if upper case found

"GUI
set guioptions-=T
set splitbelow
set splitright
set equalalways
set laststatus=2
set columns=120
set lines=60
set textwidth=0     " Do not auto insert line breaks
set cursorline
set visualbell
set shortmess=aoOtT     " Short Messages
"set cmdheight=2        " One line looks better
set fillchars+=vert:\ 
set nrformats-=octal    "Dot not assume a number is octal when ++ or --
set relativenumber  " Line numbers relative to current line

"TABS
set smarttab        " insert spaces instead of tabs
set expandtab       " uses the correct number of spaces
set smartindent     " automatically indents based on language
set shiftround      " round indent to a multiple of shiftwidth
set autoindent      " uses the indent from the previous line
set tabstop=4       " how many spaces an actual tab shows
set softtabstop=4   " how many spaces a tab uses in insert mode
set shiftwidth=4    " how many spaces a tab uses when shifting << >>


"======================================== Vim Environment ======================================

" Change Leader from \ to ,
let mapleader=','

let g:xml_syntax_folding = 1

" FileTypes
au BufRead,BufNewFile *.less set filetype=less shiftwidth=4
au BufRead,BufNewFile *.as set filetype=actionscript
au BufRead,BufNewFile *.aspx,*.asmx,*.ascx,*.master set filetype=aspnetcs

"au GUIEnter * simalt ~x         " maximize window on startup

" Execute commands silently
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

"======================================== Key Mappings =========================================

" Do commands quicker without hitting Shift
noremap ; :

"====== BUFFERS ======
map <leader>bb :buffers<CR>
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>
map <leader>bh :bprevious<CR>
map <leader>bl :bnext<CR>
map <leader>bd :bdelete<CR>

"====== SEARCH ======
" Clear Search Highlight
map <silent> <leader>/ :nohlsearch<CR>


"====== REPLACE ======
" Replace current selection with new
vnoremap <leader>r "sy:%s/<C-r>s//g<left><left>

" Add new lines after match
map <leader>n :s/<[^>]*>/\r&\r/g
"map <leader>n :s/<[^>]*>/\r&\r/g


"====== FILE ======
" Use utf-16 encoding
map <Bslash>e :e ++enc=utf-16le<CR>

" Replace ^M characters
map <leader>m :e ++ff=dos<CR>
map <Bslash>m :%s/\r/\r/g<CR>

map <leader>u :set fileformat=unix<CR>
map <leader>8 :set fileencoding=utf-8<CR>

" Edit in HEX
"map <leader>x :%!xxd<CR>
map <leader>x :Hexmode<CR>

" Alternative charaters not supported by current font
nmap <Leader>a :set guifont=Envy_Code_R_for_Powerline:h10<CR>
nmap <Leader>A :set guifont=Envy_Code_R_for_Powerline:h12<CR>


function! ToggleLanguage(language)
    if exists("b:language") && (a:language == b:language)
        :let b:language = "English"
    else
        :let b:language = a:language
    endif

    if b:language == "Arabic"
        :set rightleft
        :set guifont=Courier_New:h12
    else
        :set norightleft
        :set guifont=Envy_Code_R_for_Powerline:h10
    endif

    :echom "Setting " . b:language
endfunction

nmap <Bslash>a :call ToggleLanguage("Arabic")<CR>

" Save File
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" FileTypes and Syntax Highlighting
map <leader>fc :set ft=css<CR>
map <leader>fh :set ft=html<CR>
map <leader>fx :set ft=xml<CR>
map <leader>fp :set ft=php<CR>
map <leader>sm :set syntax=mustache<CR>

map <leader>z :set foldmethod=syntax<CR>

" Vim Quick Edit
nmap <silent> <leader>v :e ~/.vimrc<CR>
" nmap <silent> <leader>v :e ~/Dropbox/Tools/Vim/vimrc.vim<CR>
nmap <silent> <leader>s :source ~/Dropbox/Tools/Vim/vimrc.vim<CR>

" Maximize Wndow
nmap <leader>` :simalt ~x<CR>

"Toggle Text Wrap
nmap <leader>w :set wrap!<CR>

" Arrow keys move lines
"no <down> ddp
"no <up> ddP

" Move up and down based on display lines
nmap j gj
nmap k gk

" Makes it easier to increment and decrement
nnoremap <C-k> <C-a>
nnoremap <C-j> <C-x>

"Center line in window upon search and jumps
" nmap n nzz
" nmap N Nzz
nmap G Gzz
nmap } }zz
nmap { {zz

" Insert between quotes and parentheses
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Clipboard Copy Paste
map <leader>y "*y
map <leader>yy "*yy
noremap <leader>p "*p
map <leader>P "*P
map <leader>Y gg"*yG''

" Paste without copying visual selection
vmap p "_dP

"====== Plugin Mappings ======
" CtrlP
cmap <C-L> <C-F>
cmap <C-H> <C-B>

" TComment
nmap <leader>c <C-_><C-_>
vmap <leader>c <C-_>b

" NERDTree
map <F12> :NERDTreeToggle<CR>B<CR>
map <F11> :TlistToggle<CR>

" Tabular
vmap <leader>t :Tabularize /
nmap <leader>t :Tabularize /

" Go
au FileType go nmap <leader>g  :!go run %<CR><CR>
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>o <Plug>(go-coverage)

" Output css for less files - :t(no path) :r(no extension)
"!lessc --clean-css % %:r.css<CR>
"nnoremap <leader>l :execute ':silent !' . expand('~') . '/Dropbox/Tools/Vim/.vim/bundle/less.js-windows/lessc --clean-css % %:r.css'<CR>
nnoremap <leader>l :execute ":Silent " . expand('~') . '/Dropbox/Tools/Vim/.vim/bundle/less.js-windows/lessc --clean-css % %:r.css'<CR>

"======================================== Experimental ========================================
set number "line numbers
set cindent "clever indenting

set ofu=syntaxcomplete#Complete
imap <C-SPACE> <C-x><C-o>


"======================================== Plugin Settings ======================================

"Taglist
"let Tlist_Use_Horiz_Window = 1 "Sets window to split horizontally
"let Tlist_Use_Right_Window = 1 "Sets window to split vertically and to the right
"ActionScript
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

"NERDTree
let NERDTreeWinPos=1

"Tagbar
let g:tagbar_ctags_bin = 'C:\Ctags5.8\ctags.exe'

"vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"Ruby on Rails
let g:rails_default_database='mysql'
let g:rails_dbext=1

"Airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"CtrlP
" - use hjkl for navigation
let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        ['<C-l>', '<C-up>'],
    \ 'ToggleType(-1)':       ['<C-h>', '<C-down>'],
    \ 'PrtCurLeft()':         ['<left>', '<C-^>'],
    \ 'PrtCurRight()':        ['<right>'],
\ }

" Markdown Vim Mode (disable folding)
let g:vim_markdown_folding_disabled=1

"======================================== Work Automation ======================================

" MACROS

" paste script text into xml data. Start above line and jump to text before executing
let @t='0mtD``jj0bbbvi]p`tj'

" paste rows of titles or other xml tag information.
" Search for tag to replace (note line number), navigate to first row of new text, and jump to line number before executing
let @m='``0Djmt``0nwwvitp$n`t``'
"let @m='0mtD``0nwwvitpnn`tj' "Old way

" supercase till end of word (needs to have double quotes to function)
let @s="i<sup>\eea</sup>\e"
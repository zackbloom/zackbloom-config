" This must be first, because it changes other options as side effect
set nocompatible

set hidden
set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set expandtab
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

let NERDTreeChDirMode=2
set equalalways

set nobackup
set nowritebackup
set noswapfile

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

set t_Co=256

if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

set pastetoggle=<F2>

cmap w!! w !sudo tee % >/dev/null

nmap <silent> ,/ :let @/=""<CR>

nmap ,t <Esc>:CommandT<CR>

nmap ,e <Esc>:tabn<CR>
nmap ,w <Esc>:tabp<CR>
nmap ,q <Esc>:tabfirst<CR>
nmap ,r <Esc>:tablast<CR>
nmap ,<tab> <Esc>:tabs<CR>

nmap ,` <Esc>:NERDTreeToggle<CR>
nmap ,~ <Esc>:NERDTreeMirror<CR>
nmap ,b <Esc>:OpenBookmark 
nmap ,B <Esc>:BookmarkToRoot 

nmap ,1 <Esc>:NERDTree /home/www/CampDoc.com<CR>

au! BufRead,BufNewFile *.sass         setfiletype sass

"function! PlaySound()
"  silent! exec '!aplay ~/.vim/support/type.wav 2>/dev/null &'
"endfunction
"autocmd CursorMovedI * call PlaySound()

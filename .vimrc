" This must be first, because it changes other options as side effect
set nocompatible

set hidden
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
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

set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

nmap ,t :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap ,T :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

function! SpellCheck()
  :setlocal spell spelllang=en_us
endfunc

nnoremap <C-s> :call IndentToggle()<cr>
inoremap <C-s> :call IndentToggle()<cr>
vnoremap <C-s> :call IndentToggle()<cr>

" set undofile

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

" Fold HTML Tags
nnoremap <leader>ft Vatzf

" Reselect pasted text
nnoremap <leader>v V`]

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Sort CSS Properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

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

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set pastetoggle=<C-p>

cmap w!! w !sudo tee % >/dev/null

nmap <silent> ,/ :let @/=""<CR>

nmap ,e <Esc>:tabn<CR>
nmap ,w <Esc>:tabp<CR>
nmap ,q <Esc>:tabfirst<CR>
nmap ,r <Esc>:tablast<CR>
nmap ,<tab> <Esc>:tabs<CR>

nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

au! BufRead,BufNewFile *.sass         setfiletype sass
au! BufRead,BufNewFile *.handlebars         setfiletype html
au! BufRead,BufNewFile *.pug         setfiletype jade
"function! PlaySound()
"  silent! exec '!aplay ~/.vim/support/type.wav 2>/dev/null &'
"endfunction
"autocmd CursorMovedI * call PlaySound()

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au! BufRead,BufNewFile *.hamlpy setfiletype haml 

execute pathogen#infect()

" Comment and uncomment macros
let @c='0i#j'
let @u='0dlj'

let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

nmap ,g <Esc>:GoRun<cr>

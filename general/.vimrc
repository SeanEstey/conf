""" General
set mouse=a
set ruler                           " Show current position
set incsearch                       " Mimic modern browser search
set autoread                        " Reload file changed from outside
set magic                           " Reg. expressions turn magic on
set noerrorbells
set novisualbell
set showmatch
set mat=2

""" Plugins
let python_highlight_all = 1

""" File Management
set nobackup
set nowb
set noswapfile

""" Kep Mapping
nnoremap <space> za
command! E Explore

""" Color & Fonts
syntax enable
filetype on
set encoding=utf-8
highlight BadWhitespace ctermbg=red guibg=darkred

""" Text/Tab/Indenting
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
au BufNewFile,BufRead *.html        " Custom .html file settings
    \ set tabstop=2 |
    \ set expandtab |
    \ set softtabstop=0 |
    \ set shiftwidth=2 |

""" Folding
set foldmethod=indent
set foldlevel=99

""" Status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""" Helper Functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""" Macros
" Highlight whitespace errors (.py files)
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Go to last edit pos when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

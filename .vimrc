set mouse=a
set incsearch
syntax on
set encoding=utf-8

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css,*.php set tabstop=2
au BufNewFile,BufRead *.js,*.html,*.css,*.php set softtabstop=2
au BufNewFile,BufRead *.js,*.html,*.css,*.php set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

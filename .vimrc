set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=a
set incsearch
syntax on
set encoding=utf-8
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

command! E Explore

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set expandtab |
    \ set softtabstop=0 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.css,*.php
    \ set tabstop=4 |
    \ set expandtab |
    \ set softtabstop=0 |
    \ set shiftwidth=4 |

au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set expandtab |
    \ set softtabstop=0 |
    \ set shiftwidth=2 |

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

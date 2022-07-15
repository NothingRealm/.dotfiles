" 
" author: Shayan Shafaghi
" github: https://github.com/NothingRealm
" mail  : shafaghi1378@gmail.com
"

" visit the folowing site for installing Plug and learning how to work with it
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-scripts/c.vim'
Plug '907th/vim-auto-save'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'yggdroot/indentline'
Plug 'sudar/vim-arduino-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" For completely activating ycm see it's repo on github
" Plug 'ycm-core/YouCompleteMe' " execute 'rustup component add rls rust-analysis rust-src' for rust support
Plug 'whatyouhide/vim-gotham'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'morhetz/gruvbox'
Plug 'tikhomirov/vim-glsl'
Plug 'willchao612/vim-diagon'
call plug#end()

filetype plugin indent on

set clipboard=unnamedplus

filetype off
" In normal mode every char after ',' will be read as command
let mapleader = ","

set nocompatible
" Press : and then type some incomplete command you shall see the effect
set wildmenu
" Numbering line
set number
" Incremental search
set incsearch
set backspace=indent,eol,start
set autoindent
" set history to 50 :)
set history=50
" tell you where the hell you are
set ruler
" split command will split on below
set splitbelow
" vsplit command will split on right
set splitright

set encoding=utf-8
" get rid of swap files
set noswapfile
" please do not use more than 79 char in line when you are coding
set autoread
" shows the command you entered
set showcmd

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

au BufNewFile,BufRead *.py  
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

au BufNewFile,BufRead *.yaml,*.yml
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

set cindent
au BufRead,BufNewFile *.c,*.h
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal autoindent |
    \ setlocal expandtab |
    \ setlocal fileformat=unix

set foldmethod=indent
set foldlevel=79
set cursorline

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
nnoremap <space> za
" In normal mode use ,nn to go to next buffer
map <leader>nn :bn<cr>
" In normal mode use ,p to go to previous buffer
map <leader>p :bp<cr>
" In normal mode use ,bd to delete buffer
map <leader>bd :bd<cr>
" In normal mode use ,nh to hide search highlighting 
map <leader>nh :noh<cr>
" In normal mode use ,h to show search highlighting 
map <leader>h :set hlsearch<cr>
" In normal mode use ,d to go to delete line
map <leader>d "_dd

" In normal mode use enter to add new line without gooing to insert mode
nnoremap <cr> o<Esc>

" Moving around float buffer window
nnoremap <silent><nowait><expr> <C-J> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-F>"
nnoremap <silent><nowait><expr> <C-K> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-B>"
nnoremap <C-H> <C-W><C-W>

" In normal mode you can use tab to indent line
nnoremap <Tab> >>_
" In normal mode you can use Shift tab to unindent line
nnoremap <S-Tab> <<_
" Also in visual mode
vnoremap <Tab> >gv
vnoremap <S-tab> <gv

" colorscheme Tomorrow-Night 
"

set completeopt-=preview
" Some shorcut for YCM
" nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
let python_highlight_all=1


colorscheme space-vim-dark
let g:space_vim_dark_background = 233
color space-vim-dark
hi LineNr ctermbg=NONE
hi Comment ctermfg=59

" Open .ino files as cpp
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp
autocmd Filetype python,c,rust,go exe ":UpdateTags"

let g:airline#extensions#tabline#enabled = 0 
let g:airline_powerline_fonts = 1
" for darker airline uncomment the bottom line
" let g:airline_theme='minimalist' 
let g:SimpylFold_docstring_preview=1
" let g:ycm_show_diagnostics_ui = 0

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
set termbidi

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

set noshowmode

set spell
set synmaxcol=200
autocmd VimResized * wincmd =
set autoread
set breakindent
set showbreak=\\\\\

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
runtime macros/matchit.vim " extended % matching for HTML

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set clipboard=unnamedplus
set cursorcolumn
set cursorline

autocmd FileType python
            \ setlocal sw=4 |
            \ setlocal ts=4 |
            \ setlocal sts=4

" display 256 colors
set t_Co=256
set t_AB=[48;5;%dm
set t_AF=[38;5;%dm

let g:netrw_banner=0

set history=1000 " set command history
set path=$PWD/** " set path to working dir and all subdirs recursively

set laststatus=2 " always show status bar
set showcmd      " show incomplete cmds down the bottom

set wrap
set number relativenumber " line numbers
set hidden " hide buffers instead of closing
set list   " set chars for tabs, trailing spaces
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set incsearch   " find the next match as we type the search
set hlsearch    " highlight searches by default

set directory=$HOME/.vim/swapfiles// " save directory for swapfiles
set backupdir=$HOME/.vim/backups//   " save directory for backup files

set undofile                   " Save undo's after file closes
set undodir=$HOME/.vim/undos// " where to save undo histories
set undolevels=1000            " How many undos
set undoreload=10000           " number of lines to save for undo

set wmh=0 " min window height

" toggle paste mode
set pastetoggle=<F10>

" get out of insert mode
" :imap jj <Esc>

" list buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" navigate windows with Ctrl+h j k l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" set code folding
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set foldlevel=2

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

function! LightlineFilename()
    return expand('%') !=# '' ? fnamemodify(expand("%"), ":~:.") : '[No Name]'
endfunction

colorscheme behelit
set background=dark

hi clear SpellBad
hi SpellBad cterm=underline


let g:airline_theme='behelit'
let g:airline#extensions#branch#format = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

let g:airline_symbols = {}
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:bufferline_echo = 0

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

let g:syntastic_auto_loc_list = 1 " open when error, close when no error
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

let g:polyglot_disabled = ['javascript', 'jsx', 'graphql']

" Ctrl+ hjkl between tmux and vim windows
" taken from a gist comment somewhere
function! TmuxMove(direction)
    let wnr = winnr()
    silent! execute 'wincmd ' . a:direction
    " If the winnr is still the same after we moved, it is the last pane
    if wnr == winnr()
        call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
    end
endfunction

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

" json format with :J
command! J :%!python -mjson.tool

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ -s
    " ag over Ack
    let g:ackprg = 'ag --vimgrep -s'
endif

" Taken from https://github.com/junegunn/fzf/issues/31#issuecomment-49551773
function! FZFExecute()
  " Remove trailing new line to make it work with tmux splits
  let directory = substitute(system('git rev-parse --show-toplevel'), '\n$', '', '')
  if !v:shell_error
    call fzf#run({'sink': 'e', 'dir': directory, 'source': 'git ls-files', 'tmux_height': '40%'})
  else
    FZF
  endif
endfunction

command! FZFExecute call FZFExecute()

" dont auto jump to first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>f :FZF<cr>
nnoremap <Leader>g :GFiles<cr>
nnoremap <Leader>s :GFiles?<cr>
nnoremap <Leader>z :Rg<cr>

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

if empty(maparg('-', 'n'))
  noremap - :Ex<CR>
endif

" MiniBufExplorer
let g:miniBufExplStatusLineText='(╯’□’)╯︵'

highlight Pmenu ctermfg=green ctermbg=black
highlight PmenuSel ctermfg=black ctermbg=green
hi Visual ctermfg=233 ctermbg=83 gui=NONE

autocmd BufReadPre *.doc set ro
autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPost *.doc %!antiword "%"

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" line width for emails
au BufRead /tmp/mutt-* set tw=72


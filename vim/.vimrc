runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

syntax on
filetype plugin indent on
runtime macros/matchit.vim " extended % matching for HTML

set tabstop=4 shiftwidth=4 expandtab " convert tabs to spaces

" display 256 colors
set t_Co=256
set t_AB=[48;5;%dm
set t_AF=[38;5;%dm

set history=1000 " set command history
set path=$PWD/** " set path to working dir and all subdirs recursively

set laststatus=2 " always show status bar
set showcmd      " show incomplete cmds down the bottom

set wrap
set number " line numbers
set hidden " hide buffers instead of closing
" set chars for tabs, trailing spaces
set list
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
:imap jj <Esc>
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

colorscheme solarized
let g:airline_theme='solarized'
set background=dark

" Syntastic
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

let g:syntastic_auto_loc_list = 1 " open when error, close when no error
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
    set grepprg=ag\ --nogroup\ --nocolor
    " ag over Ack
    let g:ackprg = 'ag --vimgrep'
endif

" dont auto jump to first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" MiniBufExplorer
let g:miniBufExplStatusLineText='(╯’□’)╯︵'

" line width for emails
au BufRead /tmp/mutt-* set tw=72


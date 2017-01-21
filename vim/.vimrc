runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

syntax on
filetype plugin indent on
runtime macros/matchit.vim

set tabstop=4
set shiftwidth=4
set expandtab

set t_Co=256
set history=1000
set mouse=a
set path+=**

set showcmd     "show incomplete cmds down the bottom
set nowrap
set number
set laststatus=2
set fixeol
set pastetoggle=<F10>
set hidden
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set linebreak   "wrap lines at convenient points

set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backups//

set undofile                   " Save undo's after file closes
set undodir=$HOME/.vim/undos// " where to save undo histories
set undolevels=1000            " How many undos
set undoreload=10000           " number of lines to save for undo

set wmh=0

set list

:imap jj <Esc>
:nnoremap <F5> :buffers<CR>:buffer<Space>

map <C-n> :NERDTreeToggle<CR>
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

let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '|'
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "*",
            \ "Staged"    : "+",
            \ "Untracked" : "!",
            \ "Renamed"   : "<>",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "-",
            \ "Dirty"     : "x",
            \ "Clean"     : ":)",
            \ "Unknown"   : "?"
            \ }

" Syntastic
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_loc_list_height=5

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" tmux and vim
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

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" MiniBufExplorer
let g:miniBufExplStatusLineText=''

" for mutt
au BufRead /tmp/mutt-* set tw=72


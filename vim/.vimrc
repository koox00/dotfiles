runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

syntax on
filetype plugin indent on
" show existing tab with 4 spaces width
runtime macros/matchit.vim

set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set t_Co=256

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

set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backups//

set wmh=0

set list

:imap jj <Esc>
:nnoremap <F5> :buffers<CR>:buffer<Space>

map <C-n> :NERDTreeToggle<CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

colorscheme solarized
let g:airline_theme='solarized'
set background=dark

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

let $JS_CMD='node'
let jshint2_save = 1
let jshint2_min_height = 1
let jshint2_max_height = 6

let g:syntastic_scss_checkers = ['scss_lint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

command! J :%!python -mjson.tool

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


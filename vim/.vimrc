packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('ap/vim-css-color')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('alexanderjeurissen/lumiere.vim', { 'type': 'opt' })
call minpac#add('dracula/vim')
call minpac#add('dense-analysis/ale')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('janko/vim-test')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mattn/emmet-vim')
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('mileszs/ack.vim')
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('pangloss/vim-javascript')
call minpac#add('sjl/gundo.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

set noshowmode

set spell
set synmaxcol=0
set autoread
set breakindent
set showbreak=\\\\\

set ignorecase
set smartcase

set rtp+=/usr/local/opt/fzf

set termguicolors
syntax on
filetype plugin indent on
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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set history=1000 " set command history
set path=$PWD/** " set path to working dir and all subdirs recursively

set laststatus=2 " always show status bar
set showcmd      " show incomplete cmds down the bottom

set wrap
set number relativenumber
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

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

let g:netrw_banner=0

let g:gitgutter_preview_win_floating = 1

let g:airline_theme='dracula'
let g:airline#extensions#branch#format = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#gutentags#enabled = 1

let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_php_cs_fixer_use_global=1
let g:ale_completion_enabled = 1

if exists('$TMUX')
  let g:dracula_colorterm = 0
endif

if empty(maparg('-', 'n'))
  noremap - :Ex<CR>
endif

nnoremap <F5> :GundoToggle<CR>

" list buffers
nnoremap <Leader>bs :Buffers<CR>
nnoremap <Leader>bd :bdelete<CR>
nmap <Leader>v :tabedit $MYVIMRC<CR>

" navigate windows with Ctrl+h j k l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

command! FZFExecute call FZFExecute()
command! -nargs=1 ALEIgnore call ALEIgnore(<q-args>)

command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

" json format with :J
command! J :%!python -mjson.tool

" dont auto jump to first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>f :FZF<cr>
nnoremap <Leader>g :GFiles<cr>
nnoremap <Leader>z :Rg<cr>
nnoremap <Leader>s :Rgp!<cr>
nnoremap <Leader>t :GitGutterLineHighlightsToggle<cr>
nnoremap <Leader>i :ALEIgnore 0<cr>
nnoremap <Leader>n :ALEIgnore 1<cr>

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
nnoremap <silent> <C-l> :call TmuxMove('l')<cr>

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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --glob="!.git/*" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   {'options': '--delimiter : --nth 2..'})

command! -bang -nargs=? Rgp
  \ call fzf#vim#grep(
  \   'rg --hidden --glob="!.git/*" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

function! ALEIgnore(nl)
  let codes = []
  for d in getloclist(0)
    if (d.lnum==line('.'))
      let code = split(d.text,':')[0]
      call add(codes, code)
    endif
  endfor
  if len(codes)
    exe 'normal mq' . (a:nl?'':'1G') . 'O'
          \ . '/* eslint-disable' . (a:nl?'-next-line ':' ')
          \ . join(codes, ', ') . ' */' . "\<esc>`q"
  endif
endfunction

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
function! s:DimInactiveWindows()
  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    let l:range = ""
    if i != winnr()
      if &wrap
        " HACK: when wrapping lines is enabled, we use the maximum number
        " of columns getting highlighted. This might get calculated by
        " looking for the longest visible line and using a multiple of
        " winwidth().
        let l:width=256 " max
      else
        let l:width=winwidth(i)
      endif
      let l:range = join(range(1, l:width), ',')
    endif
    call setwinvar(i, '&colorcolumn', l:range)
  endfor
endfunction

augroup DimInactiveWindows
  au!
  au WinEnter * call s:DimInactiveWindows()
  au WinEnter * set cursorline
  au WinLeave * set nocursorline
augroup END

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

autocmd BufReadPre *.doc set ro
autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPost *.doc %!antiword "%"

autocmd BufWritePost .vimrc source $MYVIMRC

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" line width for emails
au BufRead /tmp/mutt-* set tw=72

hi clear SpellBad
hi SpellBad cterm=underline

hi GitGutterAdd    ctermfg=28 ctermbg=157
hi GitGutterChange ctermfg=238 ctermbg=222
hi GitGutterDelete ctermfg=124 ctermbg=225

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
"
packloadall

set background=light
colorscheme PaperColor

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

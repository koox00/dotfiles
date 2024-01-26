packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('airblade/vim-gitgutter', {'branch': 'main'})
call minpac#add('pbrisbin/vim-colors-off', {'branch': 'main'})
call minpac#add('ap/vim-css-color')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('dracula/vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('fatih/vim-go')
call minpac#add('hashivim/vim-terraform')
call minpac#add('janko/vim-test')
call minpac#add('junegunn/fzf.vim')
call minpac#add('lervag/vimtex')
call minpac#add('mattn/emmet-vim')
call minpac#add('mbbill/undotree')
call minpac#add('mileszs/ack.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('prabirshrestha/asyncomplete.vim')
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
call minpac#add('mattn/vim-lsp-settings')
call minpac#add('preservim/tagbar')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('SirVer/ultisnips')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

set noshowmode

set spell
set synmaxcol=400
set autoread
set breakindent
set showbreak=\\\\\

set ignorecase
set smartcase

set rtp+=/opt/homebrew/opt/fzf
set updatetime=100

set termguicolors
syntax on
filetype plugin indent on
runtime macros/matchit.vim " extended % matching for HTML

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" set clipboard=unnamedplus
set cursorcolumn
set cursorline

" display 256 colors
set t_Co=256
set t_AB=[48;5;%dm
set t_AF=[38;5;%dm
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set history=1000
set path=$PWD/**

set laststatus=2
set showcmd

set wrap
set number relativenumber
set hidden " hide buffers instead of closing
set list   " set chars for tabs, trailing spaces
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set wmh=0 " min window height

set incsearch   " find the next match as we type the search
set hlsearch    " highlight searches by default

set directory=$HOME/.vim/swapfiles// " save directory for swapfiles
set backup
set backupdir=$HOME/.vim/backups//   " save directory for backup files

set undofile                   " Save undo's after file closes
set undodir=$HOME/.vim/undos// " where to save undo histories
set undolevels=1000            " How many undos
set undoreload=10000           " number of lines to save for undo

set shortmess-=S

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

let mapleader=","

let g:netrw_banner=0
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

let g:polyglot_disabled = ['js', 'jsx', 'go']

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_terminal_reports_focus = 0
let g:gitgutter_enabled = 1

let test#strategy = "vimterminal"

let g:airline_theme='dracula'
let g:airline#extensions#branch#format = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

let g:tmux_navigator_disable_when_zoomed = 1

" let g:ale_sign_error = '!'
" let g:ale_sign_warning = '?'
" let g:ale_php_cs_fixer_use_global=1
" let g:ale_completion_enabled = 1

let g:fzf_preview_window = ['up', 'ctrl-/']

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1

if exists('$TMUX')
  let g:dracula_colorterm = 0
endif
let g:dracula_italic = 0

if empty(maparg('-', 'n'))
  noremap - :Ex<CR>
endif

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

nnoremap <Space> zA
vnoremap <Space> zA

nnoremap <F5> :UndotreeToggle<CR>

nmap <c-e> <Plug>NetrwRefresh

" dont auto jump to first result
cnoreabbrev Ack Ack!

nmap <Leader>v :tabedit $MYVIMRC<CR>
nmap <Leader>cr :tabedit $HOME/.config/alacritty/alacritty.toml<CR>
nmap <Leader>list :set list!<CR>
nmap <Leader>* *<C-O>:%s///gn<CR>
nmap <Leader>cs :let @+=expand("%")<CR>
nmap <Leader>cl :let @+=expand("%:p")<CR>

nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>d :Gdiffsplit<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>s :Rgp!<CR>
nnoremap <Leader>t :GitGutterLineHighlightsToggle<CR>
nnoremap <Leader>z :Rg<CR>

" nnoremap <Leader>i :ALEIgnore 0<cr>
" nnoremap <Leader>n :ALEIgnore 1<cr>

nnoremap <Leader>bs :Buffers<CR>
nnoremap <Leader>bd :bdelete<CR>

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" json format with :J
command! J :%!python -mjson.tool

command! FZFExecute call FZFExecute()
" command! -nargs=1 ALEIgnore call ALEIgnore(<q-args>)
command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ -s
    " ag over Ack
    let g:ackprg = 'ag --vimgrep -s'
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --glob="!.git/*" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   {'options': '--delimiter : --nth 2..'})

command! -bang -nargs=? Rgp
  \ call fzf#vim#grep(
  \   'rg --hidden --glob="!.git/*" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" function! ToggleBatEnvVar()
"     if (&background == "light")
"         let $BAT_THEME='Dracula'
"     else
"         let $BAT_THEME='Dracula'
"     endif
" endfunction

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

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup javascriptfolding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

augroup doc
  autocmd!
  autocmd BufReadPre *.doc set ro
  autocmd BufReadPre *.doc set hlsearch!
  autocmd BufReadPost *.doc %!antiword "%"
augroup END

augroup fugee
    au!
    au User FugitiveIndex nmap <buffer> dt :Gtabedit <Plug><cfile><Bar>Gdiffsplit<CR>
augroup END

:augroup numbertoggle
:  au!
:  au BufEnter,FocusGained,InsertLeave * set relativenumber
:  au BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" augroup update_bat_theme
"     autocmd!
"     autocmd colorscheme * call ToggleBatEnvVar()
" augroup end

" line width for emails
augroup mutt
    au!
    au BufRead /tmp/mutt-* set tw=72
augroup END

 augroup lsp_install
     au!
     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
 augroup END

augroup vimrc
  au!
  au BufWritePost,FileWritePost $MYVIMRC ++nested source $MYVIMRC
augroup END

hi clear SpellBad
hi SpellBad cterm=underline

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
"
packloadall

set background=dark
colorscheme dracula

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" ======================================
" Get more configs at:
" https://github.com/paulncd/mac-configs
" ======================================

" ===========  Vim Plug  ===========
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'dikiaap/minimalist'
Plug 'sheerun/vim-polyglot', { 'for': [] }

" Only enable vim-polyglot for javascript
autocmd FileType javascript
      \ | call plug#load('vim-polyglot')

call plug#end()

" Plugin Settings
map <C-n> :NERDTreeToggle<CR>

" Ctrl+_ NERDCommenterToggle
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:coc_node_path = $HOME.'/.nvm/versions/node/v13.3.0/bin/node'
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json']

" ===========  General  ===========
syntax on
filetype plugin indent on
set updatetime=300
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set number
set ruler
set hlsearch
set autoindent
set cursorline
set guicursor=
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set laststatus=2
set statusline=%{expand('%:p:h:t')}/%<%t\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set timeout timeoutlen=1000 ttimeoutlen=0

" =========== COLOR SCHEMES ===========
" Set filetype for unknown files
autocmd BufNewFile,BufRead *.ejs set filetype=html

" Color scheme for specific filetypes
colorscheme minimalist

" Custom Colors
autocmd FileType python hi pythonString ctermfg=125
                  \ | hi pythonQuotes ctermfg=125
                  \ | hi pythonStatement ctermfg=red
                  \ | hi pythonRepeat ctermfg=lightyellow
                  \ | hi pythonConditional ctermfg=lightyellow
                  \ | hi pythonNone ctermfg=140
                  \ | hi pythonClassVar ctermfg=red
                  "\ | hi pythonException ctermfg=yellow
                  "\ | hi pythonNumber ctermfg=magenta
                  "\ | hi pythonEscape ctermfg=lightred
                  \ | setlocal sw=2 sts=2 ts=2 expandtab
                  \ | syn keyword pythonNone None
                  \ | syn keyword pythonClassVar self cls
                  \ | syn match pythonOperator '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!='
"autocmd FileType javascript hi javaScriptStringD ctermfg=125
                  "\ | hi javaScriptStringS ctermfg=125
                  "\ | hi javaScriptNull ctermfg=magenta
                  "\ | hi javaScriptBranch ctermfg=yellow
                  "\ | hi javaScriptMember ctermfg=yellow
                  "\ | hi javaScriptRepeat ctermfg=yellow
                  "\ | hi javaScriptNumber ctermfg=magenta
                  "\ | hi javaScriptBoolean ctermfg=magenta
                  "\ | hi javaScriptIdentifier ctermfg=cyan
                  "\ | hi javaScriptReserved ctermfg=yellow
                  "\ | hi javaScriptOperator ctermfg=yellow
                  "\ | hi javaScriptStatement ctermfg=yellow
                  "\ | hi javaScriptSpecial ctermfg=lightred
                  "\ | hi javaScriptConditional ctermfg=yellow
autocmd FileType cpp hi String ctermfg=125
                  \ | hi Character ctermfg=125
                  "\ | hi Type ctermfg=cyan

" General settings for all filetypes
autocmd BufNewFile,BufRead * hi NonText ctermfg=lightgrey ctermbg=NONE
                  \ | hi Pmenu ctermbg=239 ctermfg=white
                  \ | hi CursorLineNr ctermbg=NONE ctermfg=grey
                  \ | hi CursorLine cterm=NONE ctermbg=NONE
                  \ | hi StatusLine ctermfg=255 ctermbg=239
                  \ | hi LineNr ctermfg=030 ctermbg=NONE
                  \ | hi Normal ctermbg=NONE
                  "\ | hi Comment ctermfg=lightgreen

" ===========  Mapping  ===========
" Press <F2> and <F3> to switch between buffers
nmap <F2> :bprev<CR>
nmap <F3> :bnext<CR>

" Press <Ctrl>+j/k/h/l to move around panes
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" <F1> acts like <Esc>
map <F1> <Esc>
imap <F1> <Esc>

" Press <F4> to turn off search highlighting
nmap <silent> <F4> :nohl<CR>

" Automatically append closing characters
inoremap '' '
inoremap ' ''<Left>

inoremap "" "
inoremap " ""<Left>

inoremap (( (
inoremap () ()
inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O

inoremap {{ {
inoremap {} {}
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O

inoremap [[ [
inoremap [] []
inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O

" ===========  Coc.nvim Configuration  ===========
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

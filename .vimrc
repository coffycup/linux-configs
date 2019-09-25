" Get more configs at:
" https://github.com/paulncd/mac-configs

" ===========  General  ===========
syntax on
set number
set ruler
set hlsearch
set autoindent
"set cursorline
set mouse=a
set ttymouse=sgr
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set statusline=%{expand('%:p:h:t')}/%<%t\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set timeout timeoutlen=1000 ttimeoutlen=0
filetype plugin indent on

" =========== COLOR SCHEMES ===========
" Set filetype for unknown files
autocmd BufNewFile,BufRead *.ejs set filetype=html

" Color scheme for specific filetypes
autocmd FileType * colo default
autocmd FileType vim,sh,cpp colo ron
autocmd FileType html,css colo industry
autocmd FileType python hi pythonStatement ctermfg=yellow
                  \ | hi pythonConditional ctermfg=yellow
                  \ | hi pythonException ctermfg=yellow
                  \ | hi pythonOperator ctermfg=yellow
                  \ | hi pythonRepeat ctermfg=yellow
                  \ | hi pythonQuotes ctermfg=125
                  \ | hi pythonString ctermfg=125
                  \ | hi pythonNumber ctermfg=magenta
                  \ | hi pythonEscape ctermfg=lightred
                  \ | setlocal sw=2 sts=2 expandtab
autocmd FileType javascript hi javaScriptStringD ctermfg=125
                  \ | hi javaScriptStringS ctermfg=125
                  \ | hi javaScriptNull ctermfg=magenta
                  \ | hi javaScriptBranch ctermfg=yellow
                  \ | hi javaScriptMember ctermfg=yellow
                  \ | hi javaScriptRepeat ctermfg=yellow
                  \ | hi javaScriptNumber ctermfg=magenta
                  \ | hi javaScriptBoolean ctermfg=magenta
                  \ | hi javaScriptIdentifier ctermfg=cyan
                  \ | hi javaScriptReserved ctermfg=yellow
                  \ | hi javaScriptOperator ctermfg=yellow
                  \ | hi javaScriptStatement ctermfg=yellow
                  \ | hi javaScriptSpecial ctermfg=lightred
                  \ | hi javaScriptConditional ctermfg=yellow
autocmd FileType java hi Conditional ctermfg=197
                  \ | hi StorageClass ctermfg=214
                  \ | hi Operator ctermfg=magenta
                  \ | hi Constant ctermfg=magenta
                  \ | hi Special ctermfg=lightred
                  \ | hi Statement ctermfg=yellow
                  \ | hi Exception ctermfg=yellow
                  \ | hi Repeat ctermfg=yellow
                  \ | hi Typedef ctermfg=006
                  \ | hi String ctermfg=125
                  \ | hi Type ctermfg=006
autocmd FileType cpp hi String ctermfg=125
                  \ | hi Type ctermfg=cyan
                  \ | hi Character ctermfg=125

" General settings for all filetypes
autocmd BufNewFile,BufRead * hi Normal ctermbg=NONE 
                  \ | hi LineNr ctermfg=030
                  \ | hi StatusLine ctermfg=231
                  \ | hi CursorLineNr ctermfg=243
                  \ | hi NonText ctermfg=lightgrey
                  \ | hi Comment ctermfg=lightgreen
"                  \ | hi CursorLine cterm=NONE ctermbg=234

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

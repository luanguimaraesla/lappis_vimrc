"---------------------------- Load Pathogen --------------------------- {{
execute pathogen#infect()
" }}


" ---------------------------General settings-------------------------- {{
filetype plugin on  " Enable filetype plugins
syntax on
set synmaxcol=128  " speed up syntax hi
set re=1   " Use older version of Regex module, this is faster in some languages
set nocompatible   " Use Vim settings, rather then Vi settings (much better!).
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set number
set wildignore=*.o,*~,*.pyc,*.swp
set paste   " Paste behaviour
set hidden  " Hidden buffers
set completeopt=menu  " Disable preview code when using omni complete
set modelines=1 " Allow modelines
" set spelllang=en,pt_br
" set noswapfile
" set noai   " Disable autoindentation
" }}


" ------------------------AYU theme configurations--------------------- {{
set termguicolors
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu
" }}


" ----------------------------Airline theme---------------------------- {{
let g:airline_theme = 'seagull'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" }}


" --------------------------Git plugin config-------------------------- {{
" Keep git sign column as default (+, -, ~, etc.)
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_max_signs = 10000
" }}


" ------------------------Vim markdown settings------------------------ {{
let g:vim_markdown_folding_disabled=1
" }}



" --------------------------Highlight cursor-------------------------- {{
" Set column and line highlight
set cursorcolumn
set cursorline
hi CursorLine term=bold ctermfg=Yellow gui=bold guifg=Yellow
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
" }}


" -------------------------------MAPS--------------------------------- {{
nmap <LEADER>s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-s)
nmap <LEADER>b :b#<CR>
nmap <LEADER>jk :bnext<CR>
nmap <LEADER>kj :bprevious<CR>
nmap <LEADER>l :CtrlPBuffer<CR>
nmap <LEADER>t :%s/\s\+$//g<CR>
nmap <LEADER>m :so $MYVIMRC<CR>
" Nerdtree open
map <C-n> :NERDTreeToggle<CR>
" Help function methods
map <LEADER>i  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Sonic Pi
noremap <LEADER>r :silent w !sonic_pi<CR>
noremap <LEADER>S :call system("sonic_pi stop")<CR>
" }}


" ----------------------------NERD TREE--------------------------------- {{
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set clipboard=unnamed
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}


" ---------------------General file edition config----------------------- {{
syntax on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
"}}

" ----------------------------INDENT LINE--------------------------------- {{
" let g:indentLine_char = '┇'
" let g:indentLine_first_char = '┇'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
"}}



" ----------------------------PYTHON CONFIG------------------------------ {{
au BufNewFile,BufRead *.py
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4  |
  \ set textwidth=79  |
  \ set expandtab     |
  \ set autoindent    |
  \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2     |
  \ set softtabstop=2 |
  \ set shiftwidth=2

highlight BadWhitespace guibg=red ctermbg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
  \ match BadWhitespace /\s\+$/

set encoding=UTF-8
let g:ycm_autoclose_preview_window_after_completion=1

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
"}}

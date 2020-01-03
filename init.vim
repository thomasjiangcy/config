let g:plugged_home = '~/.vim/plugged'

" Plugged list
call plug#begin(g:plugged_home)
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'

  " NERDTree
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Git
  Plug 'airblade/vim-gitgutter'

  " syntax check
  Plug 'w0rp/ale'

  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'

  " Formatter
  Plug 'Chiel92/vim-autoformat'
  
  " FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  
  " Theme
  Plug 'mhartington/oceanic-next'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on


" Key bindings

" FZF
nmap fzf :FZF<CR>

" split screen
nmap sh :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w

" move between windows
nmap <Space> <C-w>w

" quick exit vim
nmap <S-q><S-a> :qa<CR>
nmap <S-w><S-q> :wq<CR>
nmap <S-w><S-w> :w<CR>
nmap <S-q><S-q> :q<CR>

" remove highlighting
nmap noh :noh<CR>



" General configurations
set encoding=UTF-8
set updatetime=100

" UI Configurations
if (has("termguicolors"))
  set termguicolors
endif

syntax on
syntax enable

colorscheme OceanicNext

set guifont=Fura\ Code\ Regular\ Nerd\ Font\ Complete:h13

set number
set relativenumber

set noshowmode

" FZF
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

" NERDTree
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <S-Tab> :NERDTreeToggle<CR>

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_theme='oceanicnext'


" Linting
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}


" Turn off backup
set nobackup
set noswapfile
set nowritebackup


" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase


" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4


" vim-autoformat
noremap <F3> :Autoformat<CR>


" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
augroup END

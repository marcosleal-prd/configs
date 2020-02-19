set nocompatible " Defini não compatibilidade com o legado vi
syntax enable
set encoding=utf-8

filetype off
filetype plugin indent on " Carregar plugins de tipo de arquivo + indentação

set rtp+=~/.vim/bundle/Vundle.vim

" Ajuda
" :PluginList       - lista os plugins configurados
" :PluginInstall    - instala plugins; adicione ao final `!` para atualizar ou apenas :PluginUpdate
" :PluginSearch foo - procura por foo; acrescente `!` para atualizar o cache local
" :PluginClean      - confirma a remoção de plugins não utilizados; acrescente `!` para aprovar automaticamente a remoção
"
" veja :h vundle para mais detalhes ou wiki para FAQ
" Coloque suas coisas que não são do plugin depois desta linha
call vundle#begin()

" Gerenciador de Plugins
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/indentpython.vim'

" Esquemas de cores
Plugin 'dracula/vim', { 'name': 'dracula' }

" Necessário, plugins disponíveis depois.
call vundle#end()

set cursorline

set incsearch
set ignorecase
set smartcase
set autochdir

set scrolloff=10
set wrap
set lazyredraw
set number
set numberwidth=4

set hlsearch
set laststatus=2
set splitbelow
set splitright

set showcmd " Exibir comandos incompletos
set noshowmode
set ruler
set visualbell

set backspace=start,eol,indent
set showmatch
set matchtime=4

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nowritebackup
set nobackup
set autoread
set noswapfile
set history=100
set hidden

" Espaço como Líder
map <space> <leader>

" Navegação entre janelas de Buffer (CTRL + h/j/k/l)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Plugin - Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Plugin - NERDTree
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['node_modules', 'bower_components', 'tmp', 'vendor']

" Plugin - CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|tmp\|vendor\|DS_Store\|git'

" Remover Barras
set guioptions-=T
set guioptions-=t
set guioptions-=L
set guioptions-=l
set guioptions-=m
set guioptions-=r

" Pesquisa limpa
nmap \hl :nohlsearch<CR>
nmap <leader>hl :nohlsearch<CR>

" Abra um novo buffer vazio
nmap <leader>N :enew<cr>

" Mover para o próximo buffer
nmap <leader>n :bnext<CR>

" Mover para o buffer anterior
nmap <leader>p :bprevious<CR>

" Deleta o buffer
nmap <leader>D :bdelete<CR>

" Feche o buffer atual e vá para o anterior
nmap <leader>bq :bp <BAR> bd #<CR>

" Mostrar todos os buffers abertos e seu status
nmap <leader>bl :ls<CR>

" Desativar o modo automático de ir e mostrar erros
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

" Remova todos os espaços em branco à direita ao salvar
autocmd BufWritePre * :%s/\s\+$//e

" REPL
nmap <silent> <Leader>E :Eval<CR>
nmap <silent> <Leader>R :Require!<CR>

" Python & PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Outros
set term=screen-256color
set wildignore+=**/node_modules,**/bower_components,**/tmp,**/vendor,**/git

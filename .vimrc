" My Vimrc file
"
" Key mappings ----------------------------------------------------------
"
" F1        - vim help
"
" -- Comments
" gc        - comment out target of motion
" gcc       - comment out line
"
" -- File explorer
" F2        - toggle NERDTree
" F3        - open TODO list
" ,v        - show file on NERDTree
"
" -- Movement (file)
" CTRL + n (CTRL + n, CTRL + p, CTRL + x)   - multiple cursos selection
" ,,b       - backwards easy motion for word
" ,,f       - forward easy motion for letter
" ,,F       - backwards easy motion for letter
" ,,s       - easy motion for letter
" ,,w       - forward easy motion for word
"
" -- Movement (code)
"  K        - method/function signature
"  ,d       - go to definition
"  ,n       - find references
"
" -- Search
" CTRL + P  - find file
" CTRL + L  - clear search highlight
" ,f        - search content in project
" ,sr       - search and replace
"
" -- Configuration file
" ,ev       - edit .vimrc
" ,sv       - reload .vimrc
"
" -----------------------------------------------------------------------

" Let's Plug manage -----------------------------------------------------

call plug#begin('~/.vim/plugged')

" Base
Plug 'tpope/vim-sensible'               " a set of defaults
Plug 'roxma/nvim-yarp'                  " needed for deoplete 
Plug 'roxma/vim-hug-neovim-rpc'         " needed for deoplete

" Code standards
Plug 'w0rp/ale'                         " linting and fixing
Plug 'editorconfig/editorconfig-vim'    " editorconfig support
Plug 'autozimu/LanguageClient-neovim', {
\   'branch': 'next',
\   'do': 'bash install.sh',
\}
Plug 'ruanyl/vim-sort-imports', { 'do': 'npm install -g import-sort-cli import-sort-parser-babylon import-sort-parser-typescript import-sort-style-module import-sort-style-renke import-sort-style-eslint' }

" Colorschemes
Plug 'vim-airline/vim-airline-themes'   " a lot of themes for vim-airline
Plug 'dracula/vim'                      " the dracula theme for vim

" Completion
Plug 'Shougo/deoplete.nvim'             " dark powers autocomplete

" Display
Plug 'Valloric/ListToggle'              " toggle list
Plug 'vim-airline/vim-airline'          " status/tabline
Plug 'sheerun/vim-polyglot'             " language package with tons of syntax and indentation support

" File explorer
Plug 'mileszs/ack.vim'                  " ack search tool
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " fuzzy-finder for vim
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
"Plug 'mhinz/vim-signify'                " shows diff using vim columns

" Misc
Plug 'tpope/vim-commentary'             " (un)comments blocks of code

" Movement
Plug 'easymotion/vim-easymotion'        " vim motion
Plug 'terryma/vim-multiple-cursors'     " multiple selections for vim

call plug#end()

" General settings ------------------------------------------------------

let mapleader = ','

set cmdheight=2                         " height of the command bar
set completeopt=menuone,noselect
set hlsearch                            " highlight all search matches
set ignorecase                          " case insensitive search
set mouse=a                             " active mouse
set nobackup                            " no backups
set noswapfile                          " no swap files
set nowrap                              " stop line breaking
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set showmatch                           " set show matching parenthesis
set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right

" Error handling
set noerrorbells                        " no noise
set vb t_vb=                            " disable any beeps or flashes on error

" Tab/indent
set expandtab                           " use spaces instead of tabs
set shiftwidth=4 tabstop=4 softtabstop=4

" Display settings ------------------------------------------------------

set background=dark
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
set guioptions-=r                       " disable scrollbars
set guioptions-=L                       " disable scrollbars
set guioptions-=e                       " disable graphic tabs
set linespace=2                         " pixel lines between chars

" Colors
colorscheme dracula

if has('termguicolors')
    set termguicolors
endif

" Plugins settings ------------------------------------------------------

" ALE
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}

" Ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'
let g:airline#extensions#ale#enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" LanguageClient
let g:LanguageClient_serverCommands = {
\   'javascript.jsx': ['/Users/klaus/.nvm/versions/node/v8.15.0/bin/typescript-language-server', '--stdio', '--tsserver-path', 'node_modules/.bin/tsserver'] 
\}
let g:LanguageClient_diagnosticsEnable = 0 " Let's ALE manage this

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinSize = 45
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" Vim-import-sort
let g:import_sort_auto = 1

" Key Mappings ----------------------------------------------------------

nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :call TodoList()<CR>
nmap <silent> <F6> :LToggle<CR>:ALELint<CR>

" Search
nmap <leader>f :LAck!<space>

" Search and replace
nmap <leader>sr :%s///gci<Left><Left><Left><Left><Left>

" File finder
nmap <C-p> :Files<CR>

" Quickly edit/reload vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Disable 'Ex' mode
nnoremap Q <nop>

" Shows the current file on NERDTree
nmap <silent> <leader>v :NERDTreeFind<CR>

" Performing copy/paste from clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Language specific movements
nmap K :call LanguageClient#textDocument_hover()<CR>
nmap <leader>d :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nmap <leader>n :call LanguageClient#textDocument_references()<CR>

" Functions -------------------------------------------------------------

function! TodoList()
    let old_last_winnr = winnr('$')
    cclose
    if old_last_winnr == winnr('$')
        Ack! 'TODO|FIXME'
        copen
    endif
endfunction

function! ReadLocalVimrc()
    if filereadable(".vim/config.vim")
        source .vim/config.vim
    endif
endfunction

" That's all folks ------------------------------------------------------
:call ReadLocalVimrc()

" Let's Plug manage -----------------------------------------------------

call plug#begin('~/.vim/plugged')

" Base
Plug 'tpope/vim-sensible'               " a set of defaults

" Code standards
Plug 'editorconfig/editorconfig-vim'    " editorconfig support

" Colorschemes
Plug 'vim-airline/vim-airline-themes'   " a lot of themes for vim-airline
Plug 'dracula/vim'                      " the dracula theme for vim

" Display
Plug 'Valloric/ListToggle'              " toggle list
Plug 'vim-airline/vim-airline'          " status/tabline
Plug 'sheerun/vim-polyglot'             " language package with tons of syntax and indentation support

" File explorer
Plug 'mileszs/ack.vim'                  " ack search tool
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                 " fuzzy-finder for vim
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'                " shows diff using vim columns

" LSP
Plug 'autozimu/LanguageClient-neovim', {
\   'branch': 'next',
\   'do': 'bash install.sh',
\ }

" Misc
Plug 'tpope/vim-commentary'             " (un)comments blocks of code
Plug 'tpope/vim-dispatch'               " async builds and commands
Plug 'janko/vim-test'                   " running tests

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
set lazyredraw                          " faster scroll when syntax on
set mouse=a                             " active mouse
set nobackup                            " no backups
set noswapfile                          " no swap files
set nowrap                              " stop line breaking
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set showmatch                           " set show matching parenthesis
set signcolumn=yes                      " show column signs
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

" Ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Airline
let g:airline_theme = 'dracula'

" LanguageClient
let g:LanguageClient_serverCommands = {
\   'python': ['pyls'],
\ }

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinSize = 45

" Test
let test#strategy = 'dispatch'
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pytest'

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

" Key Mappings ----------------------------------------------------------

nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :call TodoList()<CR>
nmap <silent> <F7> :call LanguageClient#textDocument_formatting()<CR>

" Search
nmap <leader>f :LAck!<space>

" Search and replace
nmap <leader>sr :%s///gci<Left><Left><Left><Left><Left>

" File finder
nmap <C-p> :GFiles<CR>

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

" Running tests
nmap <leader>t :TestLast<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tt :TestFile<CR>
nmap <leader>tv :TestVisit<CR>

" Language movements
nnoremap <C-space> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>d :call LanguageClient#textDocument_definition({
            \ 'gotoCmd': 'tabnew'
            \ })<CR>
nnoremap <leader>n :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>

" That's all folks -----------------------------------------------------
:call ReadLocalVimrc()

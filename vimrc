" tmux -2 to use 256 colors
"" q: shows last commands
"" q/ shows last searches
"http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

set nocompatible
filetype plugin on
filetype plugin indent on
syntax on
filetype off				" required

execute pathogen#infect()
" set the runtime path to iclude Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ludovicchabant/vim-gutentags' 

Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must  be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required

set colorcolumn=81
set textwidth=80
set wrap
set formatoptions=qrn1


set spelllang=en		"spelling language
"" set spellfile=$HOME/.vim/wordlist/en.utf-8.add
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set hlsearch
set ruler
set wildmenu
set wildmode=list:longest
se t_Co=256
set background=dark
set number
set laststatus=2

syntax enable
let g:gruvbox_termcolors = 256 
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_contrast_dark ="soft"
colorscheme gruvbox

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>' use 4 spaces width
set shiftwidth=2
" on pressing tab insert 4 spaces
set expandtab
set cursorline
set autowrite
set encoding=utf-8
"set relativenumber

"" 4 spaces for python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

"" tame searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set showmatch



" ctags -R . 
set tags=tags;

" enable folding
set foldmethod=indent
set foldlevel=99


""airline""
set laststatus=2 	""always shows status line
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

""ctrlp""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'

"" vimwiki""
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown',
                           \ '.mdown': 'markdown' }
                    

let g:vimwiki_list = [{'path': '~/vimwiki/', 
					 \ 'syntax': 'markdown', 'ext': '.md'}]




""mappings""

let mapleader = ","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

"enable code folding with the spacebar
nnoremap <space> za

" Clear highlighting on escape in normal mode
nnoremap <silent><esc> :noh<CR><esc>
nnoremap <esc>^[ <esc>^[

""NERDTreeToggle
nnoremap <silent><leader>nt :NERDTreeToggle<esc><CR>

"" buffer toggle
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

"" tagbar toggle with f8
nmap <F8> :TagbarToggle<CR>

"" vim-go
" :GoRename for refactoring
" vif select inside function 
" vaf select whole function
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "6s"

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap<leader>b <Plug>(go-build)
autocmd FileType go nmap<leader>r <Plug>(go-run)

"ycm
"set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1


""instant markdown""
let g:instant_markdown_autostart = 0	"disable autostart
nnoremap <silent><leader>md :InstantMarkdownPreview<CR>

""nerdcommenter 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

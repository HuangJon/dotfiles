"" q: shows last commands
"" q/ shows last searches
"http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

set nocompatible
filetype plugin on
filetype plugin indent on
syntax on
filetype off

execute pathogen#infect()

set spelllang=en		"spelling language
"" set spellfile=$HOME/.vim/wordlist/en.utf-8.add
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set hlsearch
set ruler
set wildmenu
se t_Co=256
set background=dark
set number
syntax enable
"colorscheme flattened_dark
colorscheme gruvbox
set tabstop=4
set shiftwidth=4
set noexpandtab
set cursorline
set showmatch

" ctags -R . 
set tags=tags;

" enable folding
set foldmethod=indent
set foldlevel=99

""airline""
set laststatus=2

""syntastic""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""ctrlp""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'

"" vimwiki""
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }

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

"nnoremap <C-L> :nohlsearch<CR><C-W><C-L>
nnoremap <silent><esc><esc> :nohlsearch<CR><esc>

""NERDTreeToggle
nnoremap <leader>nt :NERDTreeToggle<esc><CR>

"" buffer toggle
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>


""instant markdown""
let g:instant_markdown_autostart = 0	"disable autostart
nnoremap <silent><leader>md :InstantMarkdownPreview<CR>


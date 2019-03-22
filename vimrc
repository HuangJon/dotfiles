" tmux -2 to use 256 colors
"" q: shows last commands
"" q/ shows last searches
"http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

set nocompatible
filetype plugin on
filetype plugin indent on
syntax on
" filetype off				" required



if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
" Plug 'micha/vim-colors-solarized'
" Plug 'fatih/vim-go'
Plug 'w0rp/ale'
" Plug 'Valloric/YouCompleteMe'
" Code completion
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run install script if you use fzf only in Vim.
  "
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
" Plug 'artur-shaik/vim-javacomplete2'
" Snippet manager
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
" C++ snips
" Plug 'LucHermitte/lh-cpp'

Plug 'christoomey/vim-tmux-navigator'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'morhetz/gruvbox' 
Plug 'arcticicestudio/nord-vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags' 
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ajh17/VimCompletesMe'



call plug#end()

set colorcolumn=81
set textwidth=80
set wrap
set formatoptions=qrn1


set clipboard=unnamedplus
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
set termguicolors

syntax enable
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_contrast_dark ="soft"
" colorscheme gruvbox
colorscheme palenight
" colorscheme nord
let g:nord_uniform_diff_background = 1
let g:nord_comment_brightness = 20
if &diff
    colorscheme nord
endif




" set term=screen-256color-bce
" let g:solarized_termcolors=256
" set t_Co=256
" set background=dark
" " colorscheme default
" colorscheme solarized

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



" "" deoplete
"
" " Don't forget to start deoplete
" let g:deoplete#enable_at_startup = 1
" " Less spam
" let g:deoplete#auto_complete_start_length = 2
" " Use smartcase
" let g:deoplete#enable_smart_case = 1
" ""use TAB as the mapping
" inoremap <silent><expr> <TAB>
    " \ pumvisible() ?  "\<C-n>" :
    " \ <SID>check_back_space() ? "\<TAB>" :
    " \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "" {{{
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction "" }}}
"
" " Setup completion sources
" let g:deoplete#sources = {}
" let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer', 'ultisnips']


" ctags -R . 
set tags=tags;

" enable folding
set foldmethod=indent
set foldlevel=99


"" ALE
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0

nmap <silent> <C-m> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'java'      : ['google_java_format' ],
\}

" Bind ctrl-shift-o to fixing problems with ALE
nmap <c-s-o> <Plug>(ale_fix)

" Setup compilers for languages

let g:ale_linters = {
      \  'cs'         : ['syntax', 'semantic', 'issues'],
      \  'python'     : ['pylint'],
      \  'java'       : ['javac'],
      \  'bash'       : [ 'shellcheck' ],
      \  'c++'        : [ 'clang', 'gcc' ],
      \  'dockerfile' : [ 'hadolint' ],
      \  'haskell'    : [ 'ghc' ],
      \  'vim'        : [ 'vlint' ],
      \ }

"snippets
" Since we are already using Deoplete, and using tab with both doesn't work nice use <c-j> instead
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"


""airline""
set laststatus=2 	""always shows status line
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" lightline
" Tomorrow_Night
" seoul256
" nord
let g:lightline = {
  \   'colorscheme': 'palenight',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified', 'tagbar' ],
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
  \     'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   },
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}


let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline


"" fzf mapping
map <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Use the correct file source, based on context
function! ContextualFZF()
    " Determine if inside a git repo
    silent exec "!git rev-parse --show-toplevel"
    redraw!

    if v:shell_error
        " Search in current directory
        call fzf#run({
          \'sink': 'e',
          \'down': '40%',
        \})
    else
        " Search in entire git repo
        call fzf#run({
          \'sink': 'e',
          \'down': '40%',
          \'source': 'git ls-tree --full-tree --name-only -r HEAD',
        \})
    endif
endfunction
" map <C-p> :call ContextualFZF()<CR>


" ""ctrlp""
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_switch_buffer = 'et'


" Java completion
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" autocmd FileType java JCEnable
" "" smart guess import
" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" "" import with ask
" nmap <F5> <Plug>(JavaComplete-Imports-Add)
" imap <F5> <Plug>(JavaComplete-Imports-Add)
" "" add missing imports
" nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" "" remove unused imports
" nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"
"
"
"

""mappings""

let mapleader = ","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" FZF mappings
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>



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

"" window resize 
nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +5" <CR>
nnoremap <silent> <Leader>h :exe "vertical resize -5" <CR>

:vertical resize +5
:vertical resize -5
"" vim-go
" :GoRename for refactoring
" vif select inside function 
" vaf select whole function
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "6s"

" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
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

" loading the plugin
let g:webdevicons_enable = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

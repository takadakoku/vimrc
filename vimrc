" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  " after run the command below
  " $ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
  " $ sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'posva/vim-vue'
  Plug 'diepm/vim-rest-console'
  Plug 'mattn/vim-chatgpt'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'brglng/vim-im-select'
  Plug 'tyru/eskk.vim'
  " Hit <C-j> for requesting
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

" Require ncm2 and this plugin
call plug#end()
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
set noswapfile
set tags=.tags
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set number
let NERDTreeShowHidden = 1
"タグ生成
let g:auto_ctags = 1

" エンコーディング
set encoding=utf-8
scriptencoding utf-8
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
syntax enable
autocmd BufRead,BufNewFile *.blade set syntax=html
autocmd Filetype blade.php setlocalautocmd Filetype html
:set completeopt=menuone
nmap <Tab>      gt
nmap <S-Tab>    gT
set nowrap
"colorscheme wildcharm
colorscheme wildcharm
set expandtab
set shiftwidth=4
set tabstop=4

:set expandtab
:retab 4
set listchars=tab:>-,space:-
nnoremap <silent><C-n> :NERDTreeToggle ./<CR>
nnoremap <silent><C-m> :NERDTreeToggle %<CR>
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><C-f> :Lines<CR>
nnoremap <silent><C-l> :Rg<CR>
"autocmd FileType php source <sfile>:h/php.vim
"autocmd FileType vue source <sfile>:h/vue.vim
"autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
let g:lsp_settings_filetype_vue = ['volar-server', 'typescript-language-server']
set autoindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set clipboard=unnamedplus
map <F12> <S-...><Insert>
let g:lsp_diagnostics_enabled = 0
vmap <C-_> gc
let g:lsp_settings = { 'css-languageserver': { 'cmd': ['vscode-css-language-server', '--stdio'] } }
imap <C-_> <Esc><Plug>NERDCommenterToggle
nmap <C-_> <Plug>NERDCommenterToggle
nnoremap x "_x
nnoremap X "_X

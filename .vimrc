source /usr/share/doc/fzf/examples/fzf.vim
"Set Vim-Plug
filetype off
set nocompatible

call plug#begin('~/.vim/bundle')
    Plug 'VundleVim/vundle.vim'
    Plug 'Valloric/YouCompleteMe'
    Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle'}
    Plug 'rhysd/vim-clang-format'
    Plug 'majutsushi/tagbar'
    Plug 'mattn/emmet-vim'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'StanAngeloff/php.vim', { 'for': 'php'}
    Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'reewr/vim-monokai-phoenix'
call plug#end()

filetype plugin indent on
"Set Vim-Plug


"Set vim-clang-format
let g:clang_format#style_options = {
    \ "AccessModifierOffset" : -4,
    \ "AllowShortIfStatementsOnASingleLine" : "true",
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "Standard" : "C++11"} 
let g:clang_format#auto_format=1
"Set vim-clang-format

"Set tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'         
let g:tagbar_width=30
let g:tarbar_left = 1
"Set tagbar

"Set nerdtree-tags

" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" " 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
"Set nerdtree-tags


"Other Settings
syntax on
set t_co=256
""colorscheme nachtleben
colorscheme monokai-phoenix
""set termguicolors
set autoindent
set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set confirm
set backspace=indent,eol,start
set laststatus=2
set showmode
set wrap
set autowrite
set mouse=a
set listchars=tab:▶\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"Other Settings


"Map
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <F3> :NERDTreeToggle <CR>
map <F4> :TagbarToggle <CR>  
map <F9> :!g++ % -o %< && ./%< <CR>
map <C-a> gg=G <CR>
:inoremap ; ;<space>
:inoremap ( ()<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i
:inoremap [ []<Esc>i
:inoremap {{ {}<Esc>i
:inoremap <<TAB><TAB> <%=<space>%><Esc>hi
:inoremap {<CR> {<CR>}<Esc>ko
noremap <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S>     <C-C>:update<CR>
inoremap <silent> <C-S>     <C-O>:update<CR>
"Map


"Switch Mouse Mode (Ctrl+n)
map <C-n> :call SwitchMouseMode()<CR>
map! <C-n> <Esc>:call SwitchMouseMode()<CR>
function SwitchMouseMode()
    if (&mouse == "a")
        let &mouse = ""
        echo "Mouse is disabled."
    else
        let &mouse = "a"
        echo "Mouse is enabled."
    endif
endfunction
"ctrl+n switch mouse mode

"Tab To Space
map <C-t> :call TabToSpaces()<CR>
map! <C-t> <Esc>:call TabToSpaces()<CR>
function TabToSpaces()
    retab
    echo "Convert tab to spaces."
endfunction
"Tab To Space

" Vim-php-namespace Plugin, Import classes or functions
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
" Vim-php-namespace Plugin, Import classes or functions


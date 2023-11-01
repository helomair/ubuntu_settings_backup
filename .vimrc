"source /usr/share/doc/fzf/examples/fzf.vim
"Set Vim-Plug
set encoding=utf-8
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
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "Plug 'junegunn/fzf.vim'
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


"YouCompleteMe智能补全工具
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第 2 个字符开始补全
let g:ycm_min_num_of_chars_for_completion= 2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"定义快捷健补全
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
"设置关健字触发补全
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', ' ', '(', '[', '&'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1
"定义函数跟踪快捷健
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


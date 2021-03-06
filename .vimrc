set nocompatible
filetype off                  " required

" determine OS type
if has("win32")
    let g:isWin=1
elseif has("unix")
    let g:isWin=2
else
    let g:isWin=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'ervandew/ag'
"Plugin 'Peeja/vim-cdo'
if g:isWin==2
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
else
Plugin 'Shougo/neocomplete.vim'
endif
Plugin 'SirVer/ultisnips'
Plugin 'Yggdroot/LeaderF'
Plugin 'bronson/vim-visual-star-search'
Plugin 'brookhong/cscope.vim'
"Plugin 'craigemery/vim-autotag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'honza/vim-snippets'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wellle/targets.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-shell'
Plugin 'scrooloose/syntastic'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/ctags'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
behave mswin

" different config for different OS
if g:isWin == 1
    set fileformat=dos
    au GUIEnter * simalt ~x "Maximum the initial window, only works on Windows
elseif g:isWin == 2
    set fileformat=unix
else
    set fileformat=mac
endif

" make vimrc take effect right after saving
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" set encoding
set encoding=utf-8
" define <Leader>
let mapleader="\<Space>"

" paste board shortcuts
noremap <Leader>y "*y
noremap <Leader>Y "*Y
noremap <Leader>p "*p
noremap <Leader>P "*P

" use line highlight for Insert mode.
" This is useful especially in terminal.
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" window command map
nnoremap <Leader>w <C-w>

" tab command map
nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>tc :tabclose<cr>
nnoremap <Leader>ts :tab split<cr>

"command completion
set wildmenu
set wildmode=longest:full,full


set hidden              " Allow switching away from a changed buffer without saving it
set showmatch           " Show matching brackets.
set incsearch           " Incremental search
set mouse=a             " Enable mouse usage (all modes)
set nu                  " Enable line number
set rnu                 " Enable relative line number
set ruler               " Disaply current location of curor
set sw=4                " Set 
set softtabstop=4       " Set sfot tab to 4 space
set et                  " Expand tab
set is
set hlsearch
set backspace=2
set smarttab
set nobackup
set noundofile
set nowrap
set noeb vb t_vb=       " Disable error bell and visual bell
au GUIEnter * set vb t_vb=

"file type specific indent
autocmd FileType c,cpp setlocal sw=2 softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Menu and Toolbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m
set guioptions-=T
map <silent> <F10> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<f5>

"--------------------------------------------------------------------------
" Map & for complete repeat of substitute
"--------------------------------------------------------------------------
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" use indent or syntax for fold
"set foldmethod=indent
set foldmethod=syntax
" launch vim with no fold
set nofoldenable

set nobackup

if has('gui_running')
colorscheme solarized
set background=light
else
colorscheme molokai
endif

"--------------------------------------------------------------------------
"tagbar config
"--------------------------------------------------------------------------
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_sort = 0
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_map_showproto='a'

"--------------------------------------------------------------------------
"ctrlp config
"--------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Use caching
    let g:ctrlp_use_caching = 1
endif
" set dir to repo or ancestor
let g:ctrlp_working_path_mode = 'ra'
"CtrlP for Tag
nnoremap <leader>se :CtrlPTag<cr>

"--------------------------------------------------------------------------
"NERD Tree config
"--------------------------------------------------------------------------
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
"autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <leader>n <plug>NERDTreeTabsToggle <CR>
" Do not open nerdtree when startup
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeShowHidden=1
"--------------------------------------------------------------------------
"cscove config
"--------------------------------------------------------------------------
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

"Function to toggle quickfix/location list
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" map for location list and quickfix list toggle
nnoremap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>

" Set cscope for tags
set cst

"--------------------------------------------------------------------------
"vim session config
"--------------------------------------------------------------------------
" Persist option tags.
let g:session_persist_globals = ['&tags']
let g:session_autoload = 'no'
" opensession keymap
nnoremap <leader>os :OpenSession<cr>

"--------------------------------------------------------------------------
"easy tag config
"--------------------------------------------------------------------------
nnoremap <F9> :UpdateTags<CR>
let g:easytags_async = 0
let g:easytags_dynamic_files = 2
let g:easytags_auto_update = 1
let g:easytags_auto_highlight = 0

"--------------------------------------------------------------------------
"vim-airline
"--------------------------------------------------------------------------
if has('gui_running')
let g:airline_theme='solarized'
else
let g:airline_theme='molokai'
endif

set laststatus=2
" use powerline fonts
let g:airline_powerline_fonts = 1   

if has('gui_win32')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11:cANSI
else
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
endif

" use tabline for buffer status
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

" close whitespace count
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline#extensions#whitespace#symbol = '!'
 
"--------------------------------------------------------------------------
"intend guides
"--------------------------------------------------------------------------
" enable when start up
let g:indent_guides_enable_on_vim_startup=1
" start from level 2
let g:indent_guides_start_level=2
" block size
let g:indent_guides_guide_size=1
" map for indent guide toggle
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"--------------------------------------------------------------------------
"Visual star search
"--------------------------------------------------------------------------
" use ag for recursive searching so we don't find 10,000 useless hits inside node_modules
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('grep', '--literal ' . shellescape(@/))<CR>

"--------------------------------------------------------------------------
" easy motion
"--------------------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" Jump in visual mode
vmap s <Plug>(easymotion-s)
" keep cursor colum JK motion
let g:EasyMotion_startofline = 0
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"--------------------------------------------------------------------------
" incsearch
"--------------------------------------------------------------------------
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<C-l>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" Automatically turn off search highlight
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

" Incsearch fuzzy
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<C-l>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_easyfuzzymotion())

"--------------------------------------------------------------------------
" youcompleteme
"--------------------------------------------------------------------------
if g:isWin!=1

  " disable YCM diagnostics UI, use syntastic instead
  let g:ycm_show_diagnostics_ui = 0
  " 自动补全配置
  set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
  "上下左右键的行为 会显示其他信息
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
  inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

  "youcompleteme  默认tab  s-tab 和自动补全冲突
  let g:ycm_key_list_select_completion = ['<c-j>']
  let g:ycm_key_list_previous_completion = ['<c-k>']
  let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

  let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
  let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
  let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
  let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
  "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
  "nnoremap <leader>lo :lopen<CR>	"open locationlist
  "nnoremap <leader>lc :lclose<CR>	"close locationlist
  "inoremap <leader><leader> <C-x><C-o>
  "在注释输入中也能补全
  let g:ycm_complete_in_comments = 1
  "在字符串输入中也能补全
  let g:ycm_complete_in_strings = 1
  "注释和字符串中的文字也会被收入补全
  let g:ycm_collect_identifiers_from_comments_and_strings = 0

  nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
  nnoremap <leader>gc :YcmCompleter GoToReferences<CR> " 
  nnoremap <leader>ga :YcmCompleter GoTo<CR> " 

endif

"--------------------------------------------------------------------------
" neocomplete
"--------------------------------------------------------------------------
if g:isWin==1

    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <C-j>: completion.
    inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
    " <C-k>: previous completion.
    inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
    " <C-h>, <BS>: close popup and delete backword char.
    "inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

endif
"--------------------------------------------------------------------------
" UltiSnips
"--------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Add MySnippets directory
let g:UltiSnipsSnippetDirectories=["UltiSnips", "MySnippets"]

"--------------------------------------------------------------------------
" LeaderF
"--------------------------------------------------------------------------
"nnoremap <leader>be :LeaderfBuffer<cr><C-[>
nnoremap <leader>m :LeaderfMru<cr><C-[>

"--------------------------------------------------------------------------
" bufexplorer
"--------------------------------------------------------------------------
" Do not find active buffer
let g:bufExplorerFindActive=0

"--------------------------------------------------------------------------
" syntastic
"--------------------------------------------------------------------------
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint', 'gcc']
" 设置 cpplint 的错误级别阈值（默认是 5），级别低于这一设置的不会显示
let g:syntastic_cpp_cpplint_thres = 1
let g:syntastic_aggregate_errors = 1

"--------------------------------------------------------------------------
" clang format
"--------------------------------------------------------------------------
let g:clang_format#code_style = 'google'
let g:clang_format#style_options = {
            \ "IndentWidth" : 2,
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"--------------------------------------------------------------------------
" vim -b : edit binary using xxd-format!
"--------------------------------------------------------------------------
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

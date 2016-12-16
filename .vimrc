set nocompatible
filetype off                  " required

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
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-shell'
Plugin 'rking/ag.vim'
" Plugin 'ervandew/ag'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'brookhong/cscope.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'Peeja/vim-cdo'
Plugin 'godlygeek/tabular'
Plugin 'bronson/vim-visual-star-search'
Plugin 'tpope/vim-abolish'
Plugin 'wesleyche/SrcExpl'
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

" determine OS type
if has("win32")
    let g:isWin=1
elseif has("unix")
    let g:isWin=2
else
    let g:isWin=0
endif

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

" window command map
nnoremap <Leader>w <C-w>

"command completion
set wildmenu
set wildmode=longest:full,full


set hidden              " Allow switching away from a changed buffer without saving it
set showmatch           " Show matching brackets.
set incsearch           " Incremental search
set mouse=a             " Enable mouse usage (all modes)
set rnu                 " Enable line number
set ruler               " Disaply current location of curor
set sw=4                " Set 
set ts=4                " Set tab to 4 space
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

colorscheme molokai

"--------------------------------------------------------------------------
"tagbar config
"--------------------------------------------------------------------------
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F8> :TagbarToggle<CR>

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
"CtrlP for Tag
nnoremap <F4> :CtrlPTag<cr>

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
nmap <F7> :NERDTreeToggle<cr>

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

"Browsing location list
nnoremap <F3> :lnext<cr>
nnoremap <s-F3> :lprev<cr>

"Browsing quickfix list
nnoremap <F2> :cnext<cr>
nnoremap <s-F2> :cprev<cr>

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

"--------------------------------------------------------------------------
"easy tag config
"--------------------------------------------------------------------------
nnoremap <F9> :UpdateTags<CR>
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
"let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0

"--------------------------------------------------------------------------
"vim-airline
"--------------------------------------------------------------------------
let g:airline_theme='molokai'
set laststatus=2
" use powerline fonts
let g:airline_powerline_fonts = 1   

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11:cANSI
" use tabline for buffer status
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1

 " map for buffer switch
  nnoremap <C-tab> :bn<CR>
  nnoremap <C-s-tab> :bp<CR>
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
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"--------------------------------------------------------------------------
"Visual star search
"--------------------------------------------------------------------------
" use ag for recursive searching so we don't find 10,000 useless hits inside node_modules
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('grep', '--literal ' . shellescape(@/))<CR>

"--------------------------------------------------------------------------
"Src Exp
"--------------------------------------------------------------------------
" // The switch of the Source Explorer 
nnoremap <F6> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tagbar__", 
        \ "NERD_tree_1" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
"let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next definition in the jump list 
"let g:SrcExpl_nextDefKey = "<F4>" 

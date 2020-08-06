" maintainer Alan Chen
"
"source ${HOME}/.vim/modules/vim-plug.vim
"source ${HOME}/.vim/modules/plugin_config.vim
"source ${HOME}/.vim/modules/hotkey_config.vim
set nocompatible            " Disable Vi mode
filetype off                 " Auto filetype
filetype plugin on          " Auto download filetype need plugin

"
" Plugin - Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'


" Color scheme
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdtree'

" Python
Plugin 'vim-scripts/indentpython.vim'
" 儲存時檢查程式碼的語法
Plugin 'scrooloose/syntastic'
" 新增PEP8程式碼風格檢查
Plugin 'nvie/vim-flake8'

" Auto Complete
Plugin 'Valloric/YouCompleteMe'
" search plugin
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on          " Enable Indent


"
"   Syntax
"
colorscheme onedark
"colorscheme desert
syntax on                   " Enable syntax
syntax sync maxlines=5      " Max line syntax number
syntax sync minlines=5      " Min line syntax number
set synmaxcol=200           " Mini column syntax number
set cursorline             "當前列位置標示
"set cursorcolumn           "當前欄位置標示



"
"   General
"
set list
set title
set ruler                   " Enable cursor now lineNumber
set number                  " Enable Line number
set splitright              " Split open in right
set splitbelow              " Split open in bottom
set noerrorbells            " Disable Vim err bells
set showcmd                 " Enable Commandline tip 
set showmode                " Show 'INSERT' in CommandLine 
set cmdheight=2             " Set CommandLine height=2
set linespace=0             " 行距設定為零
set backspace=2             " Enable use Backspace
set laststatus=2            " Vim statusLine Enable=2 Disable=1
set mouse=a                 " Mouse Control Option a=all n=nomal v=visul i=insert c=cmdl
set lcs=tab:>-,trail:-
set gcr=a:block-blinkon0    " Stop blink cursor
set iskeyword+=_,$,@,%,#,-  " 帶有下列符號的單字不要換行分割
set virtualedit=onemore     " Cursor可以移動當行最後一個字之後
set scrolloff=10            " Cursor到達視窗最底保留行數

"
"
"
set undofile                " Enable undo 回滾文件記錄
set history=200             " Max Vim history
set undolevels=1000         " Max的改變回滾
set undoreload=10000        " Max重載可回滾行數
set undodir=~/.undodir
set fileencoding=utf-8      " File encoding
set fencs=utf-8
set tenc=utf-8
set fenc=utf-8
set enc=utf-8
set noautowrite             " Disable Auto save
set nobackup                " No Backup file
set confirm                 " Enable confirm in quit
set ww=h,l,b,s,<,>,[,]      " 游標可以左右移到前後行
                            " b  :   Backspace
                            " s  :   Space
                            " hl :   Left,Right
                            " <> :   n/v mode Left,Right
                            " [] :   i/r mode Left,Right
set wrap                    " Auto wrap
set cindent                 " Use C/C++ Indent Style
set fdc=4
set tabstop=4               " Tab space stop
set smarttab                " Smart tab
set expandtab
set autoindent              " Auto Indent
set smartindent             " Smart Indent
set shiftwidth=4
set softtabstop=4           " Backspace can delete indent
set formatoptions=tcrqn     " Auto format
set fdm=indent
set foldmethod=marker       " Set foldmethod
set foldlevel=0             " Set fold close in start
set foldcolumn=0            " Set fold statusline width
set showmatch               " Show 相對應的括號
set wildmenu                " Vim commandline auto complete
set incsearch               " Search 時立刻顯示結果
set hlsearch                " Highlight search result
highlight Search cterm=none ctermbg=Yellow ctermfg=black
"讀取上次最後編輯的位置
"autocmd! BufWritePost .vimrc source %       " Auto reload .vimrc

" Statusline
" :h mode() to see all modes
let g:currentmode={
    \ 'n'      : 'N ',
    \ 'no'     : 'N·Operator Pending ',
    \ 'v'      : 'V ',
    \ 'V'      : 'V·Line ',
    \ '\<C-V>' : 'V·Block ',
    \ 's'      : 'Select ',
    \ 'S'      : 'S·Line ',
    \ '\<C-S>' : 'S·Block ',
    \ 'i'      : 'I ',
    \ 'R'      : 'R ',
    \ 'Rv'     : 'V·Replace ',
    \ 'c'      : 'Command ',
    \ 'cv'     : 'Vim Ex ',
    \ 'ce'     : 'Ex ',
    \ 'r'      : 'Prompt ',
    \ 'rm'     : 'More ',
    \ 'r?'     : 'Confirm ',
    \ '!'      : 'Shell ',
    \ 't'      : 'Terminal '
    \}
" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif
  return ''
endfunction
" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008
hi User4 ctermfg=008
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007

" 快速編譯
map <F4> : call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype =='python'
        exec "!time python %"
    elseif &filetype =='java'
        exec "!javac %"
        exec "!time ./&<"
    endif
endfunc

" Code style
au BufNewFile,BufRead *.java
\ set tabstop=4
\| set softtabstop=4
\| set shiftwidth=4
\| set textwidth=100
\| set expandtab
\| set autoindent
\| set fileformat=unix

au BufNewFile,BufRead *.py,*.js,*.html,*.css
\ set tabstop=2
\| set softtabstop=2
\| set shiftwidth=2
\| set textwidth=100
\| set expandtab
\| set autoindent
\| set fileformat=unix

" 標記不必要的空白
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.java match ExtraWhitespace /\s\ $/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" 完成操作之後，自動補全視窗不會消失
let g:ycm_autoclose_preview_window_after_completion=1
" 轉到定義
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" High light
let python_highlight_all=1


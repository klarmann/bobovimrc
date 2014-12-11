"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       啵啵 驴驴
"
" Version: 
"       1.0 - 2014-12-05 12:51:11
"       1.1 - 2014-12-08 20:41:19
"       1.2 - 2014-12-09 18:54:36
" Blog_post: 
"	https://klarmannde.wordpress.com
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the version from:
"
"           https://github.com/klarmann/bobovimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader键的功能设置  修改leader键为逗号
let mapleader=","
let g:mapleader = ","

" ,ee 快速编辑 .vimrc
nnoremap <leader>ee :e ~/.vimrc<CR>

" ,vv  快速编译 
nnoremap <silent><leader>vv :source ~/.vimrc<CR>

" ,w 快速保存 Fast saving
nmap <leader>w :w!<cr>

" 快速退出
if has("gui_running")
	nmap <silent> <C-q> :q!<CR>
	vmap <silent> <C-q> :q!<CR>
endif

" 设置缩写
ab noo ==============================================================
ab moo """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbreviate #e ########################################/ 
abbreviate #b /######################################## 

" 插入当前系统时间 ， 上边的版本后面时间 就是 用这个插入的，方便多了
nnoremap <F5> "=strftime("%F %H:%M:%S")<CR>gP
inoremap <F5> <C-R>=strftime("%F %H:%M:%S")<CR>

"===================================================
"插件的设置 Vundle －－ 用来管理插件 方便快捷，整齐大方。
"===================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 中文输入
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" vimim --->  input chinese
" i_ctrl-^  切换中文输入法 其实是 ctrl + 6 , 不需要shift
" ctrl- \ 更方便，同emacs 中eim 一样了， 拷贝 中文 "＋y 再粘贴到 firefox
" 就不用输入法了， 因此卸载小企鹅，企鹅
" 注意：发现ctrl-6 和 ctrl-\ 有不同 ， ctrl 6 能 用 hjkl 翻页选字， ctrl \
" 用 ctrl n 翻页。 还有就是 ctrl l 输入空格方便些。 目前偏向于 ctrl \
Plugin 'VimIM'
let g:vimim_map='c-bslash' "  Ctrl-\ 开关输入法 这样的话 就和 emacs 中的eim一样了
let g:vimim_cloud=-1 " 彻底关闭云输入
let g:vimim_toggle=-1 " 彻底关闭循环键

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'peaksea'
Plugin 'altercation/vim-colors-solarized'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" drawit --> 画图工具
" 
":DIstart，开始绘制结构化字符图形
":Distop，停止绘制结构化字符图形
"空格，绘制或擦出字符
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'DrawIt'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"NerdTree的设置 
"help NERD_tree.txt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'The-NERD-tree'
nnoremap <silent> <F12> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Netrw 是内建插件，当你使用vim尝试打开目录时，vim会自动调用netrw.vim插件打开该目录
"<F1>        显示帮助
"<cr>        如果光标下为目录，则进入该目录；如果光标下是文件，则用vim打开该文件
"-           返回上级目录 "c           切换vim的当前工作目录为正在浏览的目录
"d           创建目录 "D           删除文件或目录
"i           切换显示方式 "R           改名文件或目录
"s           选择排序方式 "x           定制浏览方式，使用你指定的程序打开该文件
" 其它常用键，诸如使用书签、隐藏符合条件的文件等，请参阅netrw帮助页。 
""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" BufExplorer Buffer Explorer / Browser.
" This plugin can be opened with <leader+o>                   
" BufExplorer已经映射了几个键绑定，
" 例如，使用”,bv“就可以打开一个垂直分割窗口显示当前的缓冲区
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'bufexplorer.zip'
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" mru.vim  Plugin to manage Most Recently Used (MRU) files. 
" Includes my own fork which adds syntax highlighting to MRU.
" This plugin can be opened with <leader+f>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'mru.vim'
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
"下面是程序语言类的 插件
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"YOUCOMPLETEME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'Valloric/YouCompleteMe'

""""""""""""""""""""""""""""""
"ctags 
""""""""""""""""""""""""""""""
"在你项目所在目录的顶层执行ctags-R，该目录下会多出个tags文件；
"在vim中引入标签数据库文件。在vim中执行命令:settags=/home/your_proj/tags
"在 ~/workspace/ 建立了 源码 0.11 目录 进行测试
"需要进行函数名、变量名、结构名、结构成员补全时输入Ctrl+X Ctrl+O，
"需要头文件名补全时输入Ctrl+X Ctrl+I，需要文件路径补全时输入Ctrl+X Ctrl+F。
" "取消补全内容以分割子窗口形式出现，只显示补全列表
"
set tags=/home/bolv/workspace/linux-0.11/tags
set completeopt=longest,menu

""""""""""""""""""""""""""""""
" Taglist
""""""""""""""""""""""""""""""
Plugin 'taglist.vim'
nnoremap <silent> <F8> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" bash 的支持
""""""""""""""""""""""""""""""
Plugin 'bash-support.vim'

""""""""""""""""""""""""""""""
" c.vim 
" h csupport 查看帮助
""""""""""""""""""""""""""""""
"    Statement oriented editing of  C / C++ programs
"   Speed up writing new code considerably.
"   Write code und comments with a professional appearance from the beginning.
"   Use code snippets
Plugin 'c.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ctrlp.vim: Fuzzy file, buffer, mru and tag finder. 
" In my config it's mapped to <Ctrl+F>, because <Ctrl+P> is used by YankRing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-f>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"mattn/emmet-vim 
" zencoding: Expanding abbreviation like zen-coding, 
" very useful for editing XML, HTML.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plugin 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  goyo.vim and vim-zenroom2: Remove all clutter and focus only on the essential.
"   Similar to iA Writer or Write Room
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'
map <leader>z :Goyo<cr>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting ,打开高亮
syntax enable

" Set extra options when running in GUI mode
set background=dark
"colorscheme peaksea
colorscheme solarized

" 设置字体
set guifont=DejaVu\ Sans\ mono\ 12 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" 设置文件的代码形式
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" Use Unix as the standard file type
set ffs=unix,dos,mac

"新建文件编码
set fenc=utf-8

"设置路径
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" 要查看 左右 10个字符的上下文
set sidescroll=10

" Configure backspace so it acts as it should act;
" 设置 insert 模式下退格键 何时可以删除光标前的字符
" 3个选项 分别是 可以删除位于行首的空格， 断行， 及 开始进入 insert
"模式前的 位置
set backspace=indent,eol,start

" 多数移动光标命令都会在行首 行尾停止不动 , whichwrap 可以控制此时行为规则
" b,s,<,> 针对normal 模式下的 退格键，空格键，左，右键  [,] 使得 左右键 在 insert 模式下也可用
" set whichwrap& 可恢复默认值，其他也是 让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]

" 改变制表符 外观 ^I 不是很美观， 改变成 >--- 显示
set listchars=tab:>-,trail:-

" 规定关键字， 就是一个word 中可以包含哪些字符,  添加	-这样的话 形如 upper-case 的
" 词就可以被当作  word了 删除一个 字符 使用 操作符 -= , 如 删除 _ set iskeyword-=_  
set iskeyword+=-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"设置光标高亮显示
set cursorline
set cursorcolumn
set ttyfast

"Always show current position  "设置 右下角的 显示 当前光标 行列信息
set ruler

" Height of the command bar
set cmdheight=2

"匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>

" Ignore case when searching
set ignorecase

" set hightlight search
set hlsearch

" set incremental search
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

"显示行号
set number

" A buffer becomes hidden when it is abandoned
set hid

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"右下角显示一个完整命令的已经完成部分
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
" spell 拼写检查打开拼写检查(Turning on the Vim spell check)::set spell
" 关闭拼写检查(Turning off the Vim spell check)：:set nospell
" :setlocal spell spelllang=en_us 
" :setlocal spell spelllang=de
" ]s        : 将光标移到下一个拼写错误处
"[s        : 将光标移到上一个拼写错误处
"zg       : 将单词加入词典
"zug     : 撤销将单词加入词典
"z=        : 拼写建议
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 窗体设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"初始窗口的宽度,初始位置
winpos 52 42 
set lines=40 columns=120

"以下设置用来是vim正确显示过长的行
set textwidth=80
set formatoptions=qrnl

"彩色显示第85行
set colorcolumn=85

"行号栏的宽度
set numberwidth=4

"设置隐藏gvim的菜单和工具栏 F1切换
set guioptions-=m
set guioptions-=T
""去除左右两边的滚动条
set go-=r
set go-=L

map <silent> <F1> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
exe "menu Foo.Bar :" . a:str
emenu Foo.Bar
unmenu Foo
endfunction
function! VisualSelection(direction, extra_filter) range
let l:saved_reg = @"
execute "normal! vgvy"
let l:pattern = escape(@", '\\/.*$^~[]')
let l:pattern = substitute(l:pattern, "\n$", "", "")
if a:direction == 'b'
execute "normal ?" . l:pattern . "^M"
elseif a:direction == 'gv'
call CmdLine("Ack \"" . l:pattern . "\" " )
elseif a:direction == 'replace'
call CmdLine("%s" . '/'. l:pattern . '/')
elseif a:direction == 'f'
execute "normal /" . l:pattern . "^M"
endif
let @/ = l:pattern
let @" = l:saved_reg
endfunction
" Returns true if paste mode is enabled
function! HasPaste()
if &paste
return 'PASTE MODE '
en
return ''
endfunction
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")
if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif
if bufnr("%") == l:currentBufNum
new
endif
if buflisted(l:currentBufNum)
execute("bdelete! ".l:currentBufNum)
endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       啵啵 驴驴
"
" Version: 
"       0.0 - 12/4/2014 14:54:03 
"
" Blog_post: 
"	https://klarmannde.wordpress.com
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the version from:
"
"           https://github.com/klarmann/bobovimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Vundel Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember; 设置命令 历史长度， 命令 是指  冒号命令 和 搜索命令
set history=700

"设置 同 vi 不相容
set nocompatible
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editting vimrc
map <silent> <leader>ee :e $vim/_vimrc<cr>

if has("gui_running")
	nmap <silent> <C-q> :q!<CR>
	vmap <silent> <C-q> :q!<CR>
endif

" 设置缩写
ab noo ==============================================================
ab moo """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbreviate #e ########################################/ 
abbreviate #b /######################################## 
abbreviate ad advertisement

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position  "设置 右下角的 显示 当前光标 行列信息
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act;
" "设置 insert 模式下退格键 何时可以删除光标前的字符
"3个选项 分别是 可以删除位于行首的空格， 断行， 及 开始进入 insert
"模式前的 位置
set backspace=eol,start,indent

" 多数移动光标命令都会在行首 行尾停止不动
" whichwrap 可以控制此时行为规则
" b,s,<,> 针对normal 模式下的 退格键，空格键，左，右键
" [,] 使得 左右键 在 insert 模式下也可用
" set whichwrap& 可恢复默认值，其他也是
set whichwrap=b,s,<,>,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers;
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"colorscheme desert
"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" 设置字体
set gfn=Bitstream_Vera_Sans_Mono:h10

"设置文件的代码形式
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

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


" 改变制表符 外观 ^I 不是很美观， 改变成 >--- 显示
set listchars=tab:>-,trail:-

" 规定关键字， 就是一个word 中可以包含哪些字符,  添加	-
" 这样的话 形如 upper-case 的词就可以被当作  word了
" 删除一个 字符 使用 操作符 -=
" 如 删除 _ set iskeyword-=_  即可
" 如何查看 设定的 选项值？ set option?  就行了 option 就是要查的选项
set iskeyword+=-

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

"设置路径
set autochdir

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^


"右下角显示一个完整命令的已经完成部分

set showcmd

" 简单映射
" F5 
" 功能 光标下 到单词尾部 {} 添加
" word-> {word}
map <F5> i{<Esc>ea}<Esc>

"同理 练习 设置 \p 给单词加括号 \c 加 大括号
"注意要移动到 单词第一个字母偶
"普通模式下
map \p i(<Esc>ea)<Esc>
map \c i{<Esc>ea}<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>


" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
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
        return 'PASTE MODE  '
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






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUG IN Manager ---Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vbundle -- plugin manager
filetype off
" 此处规定Vundle的路径
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')
Bundle 'gmarik/vundle'
filetype plugin indent on
""""""""""""""""""""""""""""""""""
" 主题色彩
""""""""""""""""""""""""""""""""""
Bundle 'oceandeep'
Bundle 'peaksea'
Bundle 'mayansmoke'
colorscheme peaksea

"""""""""""""""""""""""""""""""""
" NERD Tree
"""""""""""""""""""""""""""""""""
Bundle 'The-NERD-tree'
nmap <Esc> :NERDTreeClose<CR>
nmap <Bs> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTree<cr>
vmap <Leader>n <esc>:NERDTree<cr>

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
"  变换目录，初始目录加载
cd d:/

""""""""""""""""""""""""""""""" 
"bufexplorer.zip-- Buffer Explorer / Browser. This plugin can be opened with <leader+o>
"""""""""""""""""""""""""""""""  
Bundle 'bufexplorer.zip'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""" 
" taglist.vim--Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
""""""""""""""""""""""""""""""" 
Bundle 'taglist.vim'
map <F3> :Tlist<CR>
let Tlist_Ctags_Cmd='D:/ctags58/ctags.exe'  " 填写ctags 执行 路径
let Tlist_Use_Right_Window=1	" 让 窗口 右边 显示， 0 的 话 就是 左边 
let Tlist_Show_One_File=1	" 让 taglist 可以 同时 显示多个 文件 的 函数 列表， 如果 想 只有 1个， 设置 为 1
let Tlist_File_Fold_Auto_Close=1	" 非 当前 文件， 函数 列表 折叠 隐藏
let Tlist_Exit_OnlyWindow=1	" 当 taglist 是最后 一个 分割 窗时， 自动退出 vim 
let Tlist_Process_File_Always=0	" 不是 一直 更新 tags, 因为 没有必要
set tags=tags;		"ctrl+<leftmouse> for windows ; ctrl+] for linux;
"set tags=d:/linux2.4/tags;
set tags=C:/MinGW/include/tags;
" path for gf
set path=d:/linux-0.11/include

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" mru.vim  Plugin to manage Most Recently Used (MRU) files. 
" Includes my own fork which adds syntax highlighting to MRU. This plugin can be opened with <leader+f>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Bundle 'mru.vim'
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ctrlp.vim: Fuzzy file, buffer, mru and tag finder. 
" In my config it's mapped to <Ctrl+F>, because <Ctrl+P> is used by YankRing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-f>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"mattn/emmet-vim 
" zencoding: Expanding abbreviation like zen-coding, 
" very useful for editing XML, HTML.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Bundle 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  goyo.vim and vim-zenroom2: Remove all clutter and focus only on the essential.
"   Similar to iA Writer or Write Room
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'junegunn/goyo.vim'
Bundle 'amix/vim-zenroom2'

"nnoremap <silent> <leader>z :Goyo<cr>
map <leader>z :Goyo<cr>

filetype plugin indent on " required! 



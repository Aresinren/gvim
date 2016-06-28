""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall

set nocompatible

"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"插件的安装路径
call vundle#begin('$VIM/vimfiles/bundle/')


Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

"我添加的插件
"above the Vim UI
Bundle 'winmanager'
Bundle 'scrooloose/nerdtree'
"let NERDTreeWinPos='right'    "默认为左侧
let NERDTreeWinSize=30        "大小
map :<F2>NERDTreeToggle<CR>   "设置快捷键F2进入工作目录，按？查看NerdTree的命令
autocmd VimEnter * NERDTree
"快速的注释/取消注释多行代码
Bundle 'scrooloose/nerdcommenter'
 "多文本浏览
Bundle 'fholgado/minibufexpl.vim'
"状态栏
Bundle 'Lokaltog/vim-powerline'
"彩虹分层
Bundle 'luochen1990/rainbow'
let g:rainbow_active = 1"0 if you want to enable it later via :RainbowToggle
" 仿sublime Text 多光标编辑功能插件
Bundle 'terryma/vim-multiple-cursors'
"自动插入和格式化方括号和圆括号
Bundle 'jiangmiao/auto-pairs'
"搜索
Bundle 'kien/ctrlp.vim'
"Make gvim-only colorschemes work transparently in terminal vim
Bundle 'CSApprox'
Bundle 'taglist.vim'

set tags=tags;

" taglist设置
"
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=35        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
map <leader>t :TlistToggle<cr> "热键设置，我设置成Leader+t来呼出和关闭Taglist
" 启动 vim 时一并启动 taglist
let Tlist_Auto_Open=1

"快速显示和关闭Vim的locationlist和quickfix窗口的插件
Bundle 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>='  
let g:lt_quickfix_list_toggle_map = '<leader>q' "快速关闭窗口

"语法高亮
"""""""""""""""""""""""""""""""
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
"Bundle 'php.vim-html-enhanced' "一个TAB为3个空格 = =
"Bundle 'css_color.vim'
"增加了rgb显示颜色和同行显示多处颜色
Bundle 'skammer/vim-css-color'

"主题
Bundle 'upsuper/vim-colorschemes'


call vundle#end()
filetype plugin indent on

"主题
colorscheme monokai
"colorscheme molokai
"字体设置
"set guifont=DejaVu\ Sans\ Mono\ 15
"set guifont=Monaco:h9
"set guifont=Consolas:h12
set guifont=Consolas:h15:cANSI
set termencoding=utf-8
"解决consle输出乱码
language messages zh_CN.utf-8
set lines=45 columns=100
set number "显示行号

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
set nobackup

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu
 " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 默认窗口分割方向
"set splitbelow
set splitright

" 显示匹配
set showmatch

" 设定默认解码
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb2312,gb18030,cp936,usc-bom,euc-jp
" 设置编码
set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,chinese
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"显示竖线  列高亮，与函数列表有冲突 
set cursorcolumn
"行高亮 
set cursorline



source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


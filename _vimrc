""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall

set nocompatible

"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"����İ�װ·��
call vundle#begin('$VIM/vimfiles/bundle/')


Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

"����ӵĲ��
"above the Vim UI
Bundle 'winmanager'
Bundle 'scrooloose/nerdtree'
"let NERDTreeWinPos='right'    "Ĭ��Ϊ���
let NERDTreeWinSize=30        "��С
map :<F2>NERDTreeToggle<CR>   "���ÿ�ݼ�F2���빤��Ŀ¼�������鿴NerdTree������
autocmd VimEnter * NERDTree
"���ٵ�ע��/ȡ��ע�Ͷ��д���
Bundle 'scrooloose/nerdcommenter'
 "���ı����
Bundle 'fholgado/minibufexpl.vim'
"״̬��
Bundle 'Lokaltog/vim-powerline'
"�ʺ�ֲ�
Bundle 'luochen1990/rainbow'
let g:rainbow_active = 1"0 if you want to enable it later via :RainbowToggle
" ��sublime Text ����༭���ܲ��
Bundle 'terryma/vim-multiple-cursors'
"�Զ�����͸�ʽ�������ź�Բ����
Bundle 'jiangmiao/auto-pairs'
"����
Bundle 'kien/ctrlp.vim'
"Make gvim-only colorschemes work transparently in terminal vim
Bundle 'CSApprox'
Bundle 'taglist.vim'

set tags=tags;

" taglist����
"
let Tlist_Show_One_File=1    "ֻ��ʾ��ǰ�ļ���tags
let Tlist_WinWidth=35        "����taglist���
let Tlist_Exit_OnlyWindow=1  "tagList���������һ�����ڣ����˳�Vim
let Tlist_Use_Right_Window=1 "��Vim�����Ҳ���ʾtaglist����
map <leader>t :TlistToggle<cr> "�ȼ����ã������ó�Leader+t�������͹ر�Taglist
" ���� vim ʱһ������ taglist
let Tlist_Auto_Open=1

"������ʾ�͹ر�Vim��locationlist��quickfix���ڵĲ��
Bundle 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>='  
let g:lt_quickfix_list_toggle_map = '<leader>q' "���ٹرմ���

"�﷨����
"""""""""""""""""""""""""""""""
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
"Bundle 'php.vim-html-enhanced' "һ��TABΪ3���ո� = =
"Bundle 'css_color.vim'
"������rgb��ʾ��ɫ��ͬ����ʾ�ദ��ɫ
Bundle 'skammer/vim-css-color'

"����
Bundle 'upsuper/vim-colorschemes'


call vundle#end()
filetype plugin indent on

"����
colorscheme monokai
"colorscheme molokai
"��������
"set guifont=DejaVu\ Sans\ Mono\ 15
"set guifont=Monaco:h9
"set guifont=Consolas:h12
set guifont=Consolas:h15:cANSI
set termencoding=utf-8
"���consle�������
language messages zh_CN.utf-8
set lines=45 columns=100
set number "��ʾ�к�

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �ļ�����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��Ҫ�����ļ��������Լ���Ҫȡ�ᣩ
set nobackup

" ��Ҫ����swap�ļ�����buffer��������ʱ��������
setlocal noswapfile
set bufhidden=hide

" �ַ���������������Ŀ
set linespace=0

" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu
 " ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set confirm
" Ĭ�ϴ��ڷָ��
"set splitbelow
set splitright

" ��ʾƥ��
set showmatch

" �趨Ĭ�Ͻ���
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb2312,gb18030,cp936,usc-bom,euc-jp
" ���ñ���
set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,chinese
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"��ʾ����  �и������뺯���б��г�ͻ 
set cursorcolumn
"�и��� 
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


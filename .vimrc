" ===== 基础设置 =====
set nocompatible             " 禁用 Vi 兼容模式
set encoding=utf-8           " 使用 UTF-8 编码
set fileencodings=utf-8      " 自动识别文件编码

" ===== 界面设置 =====
syntax enable                " 启用语法高亮
set number                   " 显示行号
set relativenumber           " 相对行号
set cursorline               " 高亮当前行
set showmatch                " 显示括号匹配
set laststatus=2             " 总是显示状态栏
set title                    " 在终端标题显示文件名
set scrolloff=5              " 滚动时保留 5 行上下文
set signcolumn=yes           " 始终显示标记列（用于错误提示）

" ===== 编辑设置 =====
set expandtab                " 使用空格代替制表符
set tabstop=4                " 制表符宽度
set shiftwidth=4             " 自动缩进宽度
set softtabstop=4            " 退格键删除缩进
set autoindent               " 自动缩进
set smartindent              " 智能缩进
set nowrap                   " 不自动换行
set backspace=indent,eol,start " 更自然的退格行为
set hidden                   " 允许在未保存时切换缓冲区

" ===== 搜索设置 =====
set ignorecase               " 搜索忽略大小写
set smartcase                " 如果有大写则区分大小写
set incsearch                " 实时搜索
set hlsearch                 " 高亮搜索结果
nnoremap <silent> <Esc> :nohlsearch<CR><Esc> " ESC 取消高亮

" ===== 快捷键设置 =====
let mapleader = " "          " 设置 Leader 键为空格

" 快速保存
nnoremap <leader>w :w<CR>

" 快速退出
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" 缓冲区导航
nnoremap <leader>n :bn<CR>   " 下一个缓冲区
nnoremap <leader>p :bp<CR>   " 上一个缓冲区
nnoremap <leader>d :bd<CR>   " 关闭当前缓冲区

" 窗口导航
nnoremap <C-h> <C-w>h       " 左窗口
nnoremap <C-j> <C-w>j       " 下窗口
nnoremap <C-k> <C-w>k       " 上窗口
nnoremap <C-l> <C-w>l       " 右窗口

" 快速编辑 Vim 配置
nnoremap <leader>rc :e ~/.vimrc<CR>

" ===== 文件类型设置 =====
filetype plugin indent on    " 启用文件类型检测

" Python 特定设置
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Markdown 特定设置
autocmd FileType markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

" ===== 剪贴板集成 (Wayland/X11 兼容) =====
if executable('wl-copy') && !empty($WAYLAND_DISPLAY)
  " Wayland 环境
  vnoremap <leader>y :'<,'>w !wl-copy<CR><CR>
  nnoremap <leader>p :r!wl-paste<CR>
elseif executable('xclip')
  " X11 环境
  vnoremap <leader>y :'<,'>w !xclip -selection clipboard<CR><CR>
  nnoremap <leader>p :r!xclip -selection clipboard -o<CR>
endif

" ===== 状态栏设置 =====
set statusline=%F            " 完整文件路径
set statusline+=\ %m         " 修改标志
set statusline+=\ %r         " 只读标志
set statusline+=%=           " 右对齐
set statusline+=\ %y         " 文件类型
set statusline+=\ %l/%L      " 当前行/总行数
set statusline+=\ %p%%       " 文件位置百分比

" ===== 其他实用功能 =====
" 保存时自动删除行尾空白
autocmd BufWritePre * :%s/\s\+$//e

" 记住上次打开的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 快速打开文件浏览器
nnoremap <leader>e :Explore<CR>

" ===== 配色方案 =====
try
  colorscheme desert         " 使用内置的 desert 主题
catch
  " 如果主题不存在则使用默认
endtry

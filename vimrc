"
"__     __  ___   __  __ 
"\ \   / / |_ _| |  \/  |
" \ \ / /   | |  | |\/| |
"  \ V /    | |  | |  | |
"   \_/    |___| |_|  |_|
"                        
"


"plug安装打开终端并运行以下命令：
"$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"Neovim 使用以下命令安装 Vim-plug：
"$ curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


" vim 配置

"进入
"cd ~/.vim
"vim .vimrc

" noremap   改键位  格式:   noremap 旧键位 新键位

" map       指定键位完成命令行某个动作      格式:     map S :w<CR>
"说明:"S"为可视式下快捷键":w"意思是命令行模式下的写入命令"CR"作用是可视模式下回车按下S就会完成写入
"plug  安装命令  :pluginstall

"coc配置
"1.安装nodejs
"2.安装ccls
"打开vim，进入命令行模式
"输入CocConfig
"编辑compile_commands.json文件
"加入
"{
"  "languageserver": {
"    "ccls": {
"      "command": "ccls",
"      "filetypes": ["c", "cpp", "objc", "objcpp"],
"      "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/"],
"      "initializationOptions": {
"         "cache": {
"           "directory": "/tmp/ccls"
"         }
"       }
"    }
"  }
"}
"





"错误提示：

"[coc.nvim] javascript file not found, please compile the code or use release branch.
" ENTER or type command to continue
"
"1.进入coc.nvim目录
"cd ~/.vim/plugged/coc.nvim/
"2.挂梯子执行install.sh
"./install.sh
"3.进入vim执行命令
":PlugInstall


"----------------------------------------------------------------------------------------------------




"清除搜索目标的高亮代码
let mapleader=" "
"高亮显示代码
syntax on

"显示行号 set number == set show number=1 ;set nonumber ==set show number=0
set number
"显示当前行距离上下行号     关闭:set norelativenumber
set relativenumber
"当前行下标线
set cursorline
"自动换行
set wrap
"展示输入内容
set showcmd
"tab快速补全
set wildmenu
"tab = 4
set tabstop=4
"当前行 下始终有5行
set scrolloff=7



"编码
set encoding=utf-8
"使vim可以使用鼠标
"set mouse=a
"终端配色问题
let &t_ut=''
"显示行尾空格
"set list
"set listchars=tab:▸\ ,trail:▫

"收起代码
"set foldmethod=indent
"set foldlevel=99


" 设置状态行当前设置
" 设置 laststatus = 0 ，不显式状态行
" 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" 设置 laststatus = 2 ，总是显式状态行
set laststatus=2

"vim执行命令会在当前目录下执行
set autochdir


"查找搜索 /+目标+回车为搜索

"高亮显示查找目标
set hlsearch
"每次打开vim使清除显示上次搜索的内容
exec "nohlsearch"
"输入时高亮显示搜索目标
set incsearch
"查找时忽略大小写
set ignorecase
"智能大小写
set smartcase
"查找下一个
noremap = nzz
noremap - Nzz
"空格加回车会清空查找内容
noremap <LEADER><CR> :nohlsearch<CR>


"因为小写s的功能是删除字符并插入   防止与新改的S误按让它no opertion没有功能
map s <nop>
"大写S为shift+w
map W :w<CR>
"大写Q为shift+q
map Q :q<CR>
";为shift+:
map ; :
"R为shift+source $MYVIMRC<CR>刷新vim配置
map R :source $MYVIMRC<CR>

"map <up> :res +5<CR>
"map <down> :res -5<CR>
"map <left> :vertical resize-5<CR>
"map <right> :vertical resize+5<CR>


"new tab
map ta :tabe<CR> 
map th :-tabnext<CR> 
map tl :+tabnext<CR> 


map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


"关闭文件后再次打开会回到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



"其他
"call  figlet
map nb :r !figlet 


"================================================
" _ __ | |_   _  __ _ 
"| '_ \| | | | |/ _` |
"| |_) | | |_| | (_| |
"| .__/|_|\__,_|\__, |
"|_|            |___/ 
"------------------------------------------------

"plug
map PS :PlugStatus<CR> 
map PI :PlugInstall<CR> 

"方便插件识别  以及识别不同文件格式
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"plug下载插件
call plug#begin('~/.vim/plugged')


"------------------------------------------------

" Use release branch (Recommend) coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}


"------------------------------------------------

" Undo Tree文件修改历史
Plug 'mbbill/undotree/'


"------------------------------------------------

" Nerdtree    文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"NERDTree-Git
"Plug 'Xuyuanp/nerdtree-git-plugin'


"------------------------------------------------

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

"------------------------------------------------

"Goyo 
Plug 'junegunn/goyo.vim' 

"------------------------------------------------


" Bookmarks
Plug 'kshenoy/vim-signature'

"------------------------------------------------
"状态栏vim
Plug 'vim-airline/vim-airline'


"------------------------------------------------
call plug#end()

"================================================




" ===       
" ===
" ===
"插件配置

" ===
" ===文件树 tt
" ===
map tt :NERDTreeToggle<CR>

	let NERDTreeMapOpenExpl = ""
	let NERDTreeMapUpdir = ""
	let NERDTreeMapUpdirKeepOpen = "l"
	let NERDTreeMapOpenSplit = ""
	let NERDTreeOpenVSplit = ""
	let NERDTreeMapActivateNode = "i"
	let NERDTreeMapOpenInTab = "o"
	let NERDTreeMapPreview = ""
	let NERDTreeMapCloseDir = "n"
	let NERDTreeMapChangeRoot = "y"


" ==
" " == NERDTree-git
" " ==


" ===
" === Taglist函数列表
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === Undotree历史记录
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>


" ===
" === Goyo免打扰
" ===
map GY :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }





"
"---------------------------------------------------------------------
"
"  ___ ___   ___ 
" / __/ _ \ / __|
"| (_| (_) | (__ 
" \___\___/ \___|
                

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>








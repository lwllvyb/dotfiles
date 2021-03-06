
" 设置 leader 映射
let g:mapleader=","
let g:maplocalleader=';'

" 基础配置
set number
set hlsearch "搜索高亮

set encoding=utf-8

set pastetoggle=<F2>
set t_Co=256

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" 关闭 record
map q <Nop>

" 开启折叠
" zc zo
" set foldmethod=syntax
" set foldnestmax=1

inoremap jj <Esc>`^
map <C-.> <Esc>`^

" 保存文件
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

"  切换 buffer
nnoremap <silent> bp :bprevious<CR>
nnoremap <silent> bn :bnext<CR>
nnoremap <leader>bd :bw<CR>

" 切换windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" 搜索结果放置到中间
nnoremap n nzzzv
nnoremap N Nzzzv

" 设置 popup 背景
if has("mac")
elseif has("unix")
endif

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/vim-quickui'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'chxuan/vimplus-startify'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rhysd/vim-clang-format'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
if has('nvim') || has('patch-8.0.902')
	Plug 'mhinz/vim-signify'
else
	Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
" Plug 'Chiel92/vim-autoformat'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'farmergreg/vim-lastplace'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法检测
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ap/vim-buftabline'

Plug 'scrooloose/nerdcommenter'
Plug 'tyru/caw.vim'


" 创建文件插入预定义代码
Plug 'chxuan/prepare-code'
" 你自己的代码仓库 git 地址
Plug 'honza/vim-snippets'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'APZelos/blamer.nvim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/indentLine'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'MattesGroeger/vim-bookmarks'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ferrine/md-img-paste.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

"""""  内嵌 shell""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/vim-terminal-help'
""""" text         """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
call plug#end()
"---------------------------------------------------------------------------------------------
" auto install plugin
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"---------------------------------------------------------------------------------------------
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
aug END
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"---------------------------------------------------------------------------------------------
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
command! -nargs=0 Format :call CocAction('format')
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>
" nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>a       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>s       :<C-u>CocFzfList symbols<CR>
"---------------------------------------------------------------------------------------------

let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

"---------------------------------------------------------------------------------------------

" 高亮当前行
set cursorline

"---------------------------------------------------------------------------------------------
"noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s", expand("<cword>"))<CR><CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>
noremap pr :<C-U><C-R>=printf("Leaderf mru")<CR><CR>
let g:Lf_ShortcutF = 'pf'
let g:Lf_IgnoreCurrentBufferName = 1 " 当前buffer 不显示名字
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RootMarkers = ['.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_WildIgnore = {
			\ 'dir': ['.git'],
			\ 'file': ['.gitignore', 'G*', "*.cleaned", "*.html"]
			\}

let g:Lf_NormalMap = {
			\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
			\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
			\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
			\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
			\ "Rg": [["<ESC>", ':exec g:Lf_py "rgExplManager.quit()"<CR>']],
			\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
			\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
			\ }

" let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_Gtagslabel = 'native-pygments'

"---------------------------------------------------------------------------------------------
augroup cbindings
	autocmd! cbindings
	let g:Lf_RgConfig = [
				\ "--max-columns=150",
				\ "--type={c,cpp}",
				\ "--glob=!git/*",
				\ "--hidden"
				\ ]
	" autocmd Filetype cpp,c,h nmap <buffer> <silent> fr :GscopeFind c <C-R><C-W><cr>
	" autocmd Filetype cpp,c,h nmap <buffer> <silent> fd :GscopeFind g <C-R><C-W><cr>
	" autocmd Filetype cpp,c,h nmap <buffer> <silent> fs :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
	"  autocmd Filetype cpp,c,h nmap <buffer> <silent> fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
	"  autocmd Filetype cpp,c,h nmap <buffer> <silent> fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
	"  autocmd Filetype cpp,c,h nmap <buffer> <silent> fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
	"  autocmd Filetype cpp,c,h nmap <buffer> <silent> fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
	"  autocmd Filetype cpp,c,h nmap <buffer> <silent> fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
	set ts=4
	set shiftwidth=4
augroup end

" let g:go_build_tags = 'PRODUCT'
augroup gobindings
	autocmd! gobindings
	autocmd Filetype cpp,c,h,go nmap <buffer> <silent> fr <Plug>(coc-references)
	" autocmd Filetype go nmap <buffer> <silent> fd <Plug>(go-def)
	autocmd Filetype cpp,c,h,sh,go,python nmap <buffer> <silent> fd <Plug>(coc-definition)
	autocmd Filetype cpp,c,h,sh,go,python nmap <buffer> <silent> fi <Plug>(coc-implementation)
	autocmd Filetype sh,go,python nmap <buffer> <silent> fn :<C-u>CocNext<CR>
	autocmd Filetype sh,go,python nmap <buffer> <silent> fp :<C-u>CocPrev<CR>
	autocmd Filetype sh,go,python nmap <buffer> <silent> fo :<C-u>CocListResume<CR>
	"autocmd Filetype go,python nmap <buffer> <silent> <leader>o :<C-u>CocList outline<CR>
	autocmd Filetype json,go,python au BufWrite * :Format
	set ts=4
	set shiftwidth=4
augroup end
" highlight json comment
autocmd FileType json syntax match Comment +\/\/.\+$+
"---------------------------------------------------------------------------------------------

" 设置预定义代码路径
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")


"---------------------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let g:NERDCreateDefaultMappings = 0
map <leader>ll <plug>NERDCommenterToggle

" creat user map command
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
nmap <Leader>mm :BookmarkAnnotate<CR>
nmap <Leader>ma :BookmarkShowAll<CR>


let g:indentLine_char_list = ['|', '¦', '┆', '┊']

autocmd FileType markdown command! -nargs=0 Pic :call mdip#MarkdownClipboardImage()
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:go_fmt_command = "goimports"
let g:go_bin_path = "/home/sankuai/go/bin"

" 创建随机颜色数量
function! Random(n)
	let g:interestingWordsTermColors = []
	let s:i = 0
	while s:i < a:n
		let timestamp = reltimestr(reltime())[-3:]
		let randomColor = float2nr(str2float(timestamp) - floor(str2float(timestamp) / 250) * 250)
		call add(g:interestingWordsTermColors, randomColor)
		let s:i+=1
	endwhile
	"return float2nr(floor(a:n * timestamp/100))
endfunction

call Random(30)

"let g:interestingWordsRandomiseColors = 1

" ludovicchabant/vim-gutentags
" 0 or s: Find this symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
"9 or a: Find places where this symbol is assigned a value
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" enable gtags module
" let g:gutentags_modules = ['gtags_cscope']

" generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1

nnoremap <C-e> :call TerminalToggle()<cr>
tnoremap <C-e><C-e> <C-\><C-n>

" 使用 ss 启用
nmap ss <Plug>(easymotion-s2)

" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
			\ [ "&New File\tCtrl+n", 'new' ],
			\ [ "&Open File\t(F3)", 'echo 1' ],
			\ [ "&Close", 'echo 2' ],
			\ [ "--", '' ],
			\ [ "&Save\tCtrl+s", 'echo 3'],
			\ [ "Save &As", 'echo 4' ],
			\ [ "Save All", 'echo 5' ],
			\ [ "--", '' ],
			\ [ "E&xit\tAlt+x", 'echo 6' ],
			\ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
			\ [ '&Copy', 'echo 1', 'help 1' ],
			\ [ '&Paste', 'echo 2', 'help 2' ],
			\ [ '&Find', 'echo 3', 'help 3' ],
			\ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" register HELP menu with weight 1000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1
let g:quickui_border_style = 2
let g:quickui_color_scheme = 'solarized'

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>
noremap <space>b :call quickui#tools#list_buffer('e')<cr>
" noremap <leader>o :call quickui#tools#list_function()<cr>

" close the terminal with job
autocmd ExitPre * for i in term_list() | exe ':bd! ' . i | endfor

"
nnoremap <silent> gn  :GitGutterNextHunk<cr>
nnoremap <silent> gp  :GitGutterPrevHunk<cr>
nnoremap <silent> gv  :GitGutterPreviewHunk<cr>
set updatetime=100

inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

com! FormatShell %!~/.dotfiles/bin/shfmt -p -i 4 -bn -ci -s
com! FormatJSON %!python3 -m json.tool
augroup formats
	autocmd! formats
	" format python
	"autocmd FileType vim,python autocmd BufWrite * :Autoformat
	" format shell
	" autocmd FileType sh autocmd BufWrite * :FormatShell
	" format json
	" autocmd FileType json autocmd BufWrite * :FormatJSON
	" format golang and import
	autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
augroup end

"ale 语法
let g:ale_linters_explicit = 1
let g:ale_linters = {
	\   'c': ['gcc', 'cppcheck'],
  	\   'cpp': ['gcc', 'cppcheck'],
  	\}

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=gnu99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta


" cpp 高亮
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

let $GOPATH=system("git rev-parse --show-toplevel | tr -d '\\n'")


" clang-format
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>ff :ClangFormat<CR>

map J :+5<CR>
map K :-5<CR>
 "noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
 noremap <leader>ps :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
 " search visually selected text literally
 xnoremap <leader>ps :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
 noremap go :<C-U>Leaderf! rg --recall<CR>

" 配置 git blame
 let g:blamer_enabled = 0
 let g:blamer_delay = 500
 let g:blamer_date_format = '%y/%m/%d-%H:%M'
 let g:blamer_template = '<commit-short> <committer-time> <committer> <summary>'
 let g:blamer_show_in_visual_modes = 0
 let g:blamer_show_in_insert_modes = 0
 let g:blamer_relative_time = 0

" fzf
let g:fzf_preview_window = []
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
noremap <leader>pf :ProjectFiles<CR>
 noremap <leader>ps :<C-U><C-R>=printf("Rg %s", expand("<cword>"))<CR>

" coc-fzf
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> <leader>hh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


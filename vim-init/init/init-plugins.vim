"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

let mapleader='space'


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))


"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------
" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'
" 文件浏览器，代替 netrw
Plug 'justinmk/vim-dirvish'
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'luochen1990/rainbow'
Plug 'lwllvyb/vim-workspace'

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()


" if hidden is not set, TextEdit might fail.
set hidden
" Some server have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Remap for rename current word
nmap <space>rn <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> <space>gd <Plug>(coc-definition)
nmap <silent> <space>gy <Plug>(coc-type-definition)
nmap <silent> <space>gi <Plug>(coc-implementation)
nmap <silent> <space>gr <Plug>(coc-references)<Paste>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>fs  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>fp  :<C-u>CocList -I symbols<cr>


" leaderf
noremap <space>ff :LeaderfFile<cr>
let g:Lf_UseVersionControlTool = 0
let g:Lf_WildIgnore = {
            \ 'dir': ['.vscode*', '.git*'],
            \ 'file': []
            \}

" nerdtree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <space>nt :NERDTreeToggle<CR>

" ranbow
let g:rainbow_active=1

let g:workspace_session_name = 'session.vim'
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir=$HOME . './.vim/sessions/undodir'
let g:workspace_autosave_always = 1
let g:workspace_autosave_untrailspaces = 0

"dein Scripts-----------------------------
filetype plugin indent on
syntax enable
filetype off                  " required

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/eduard/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/eduard/.cache/dein')
  call dein#begin('/Users/eduard/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/eduard/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('mileszs/ack.vim')
  call dein#add('thaerkh/vim-workspace')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
 " For async completion
 " call dein#add('Shougo/deoplete.nvim')
 " For Denite features
  call dein#add('Shougo/denite.nvim') 

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"set relativenumber

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'mhartington/deoplete-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plugin 'jparise/vim-graphql'        " GraphQL syntax
Plugin 'eslint/eslint'
Plugin 'w0rp/ale'
Plugin 'preservim/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-fugitive'
Plugin 'puremourning/vimspector'
Plugin 'neoclide/coc.nvim', {'rev': '*', 'branch':'release'}
Plugin 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plugin 'doums/darcula'

"let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
" VIM-WORKSPACE
let g:workspace_autosave_always = 1
let g:workspace_autosave_untrailspaces = 0
"
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"NERDTree keymap
map <C-n> :NERDTreeToggle<CR>

Plugin 'fatih/vim-go'
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

nnoremap <Leader>jh <Plug>(JsFileImportList)

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint']
 \ }


let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_max_signs = -1   " default value (otherwise)

" Gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

command! Gqf GitGutterQuickFix | copen

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" ...
" Gutter

let $NVIM_NODE_LOG_FILE='nvim-node.log'
let $NVIM_NODE_LOG_LEVEL='warn'

" Debugger
let g:vimspector_enable_mappings='HUMAN'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

colorscheme darcula

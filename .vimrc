" Don't pretend to be Vi
set nocompatible

" Enable syntax highlighting
syntax on

" generate tags for ctags
command! GenTags !ctags -R --exclude=node_modules --exclude=coverage --languages=TypeScript .

" Enable filetype and indent plugin on
filetype indent plugin on

" View changes to file before saving
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

"""""""""""""""""""""""""""
"                         "
"     SOME BASIC SETs     "
"                         "
"""""""""""""""""""""""""""
" Auto-indent
set autoindent

" Dark background
set background=dark

" ColorColumn
set cc=80
highlight ColorColumn ctermbg=7 guibg=orange

" Cursorline
set cursorline

" Cursor line options 
set cursorlineopt=number

" Encoding
set encoding=UTF-8

" Convert tabs to spaces
set expandtab

" Fold comments by default
set fdm=marker fmr=\/\*,\*\/

" Highlight Search results
set hls

" Ignore case for searching
set ic

" Enable incremental search
set incsearch

" Show status all the time
set laststatus=2

" Enable line break and show breaks with ellipsis
set linebreak
set showbreak=...

" Don't generate swap files
set noswapfile

" Enable line numbers
set nu

" Set path for in-built fuzzy file search
set path+=**

" Enable relative line numbering
set relativenumber

" Set shiftwidth
set shiftwidth=2

" Show number of matches
set shortmess-=S
" Set showmatch
set showmatch
" Jump between '<' and '>'
set mps+=<:>

" Enable smart indent
set smartindent

" Set softtabstop
"set softtabstop=2
set tabstop=2

" Spell check
set spell

" Set split direction
set splitright splitbelow

" Set tags for ctags
set tags=tags

" Set update time
set updatetime=500
" Set visual bell
" set visualbell t_vb=

" Tab to search for auto-complete suggestion
set wildmenu

" Set wrap
set wrap

"""""""""""""""""""""
"                   "
"      Plugins      "
"                   "
"""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"colour theme
Plug 'morhetz/gruvbox'

" light line
Plug 'itchyny/lightline.vim'

" Autocomplete
Plug 'ycm-core/YouCompleteMe'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" typescript syntax
Plug 'leafgarland/typescript-vim'

" File explorer
Plug 'preservim/nerdtree'

" Convert lines to comments
Plug 'tpope/vim-commentary'

" Live scratchpad
" Plug 'metakirby5/codi.vim'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Emmet
"Plug 'mattn/emmet-vim'

" Undo tree
"Plug 'mbbill/undotree

" Git wrapper
Plug 'tpope/vim-fugitive'

" CtrlP Fuzzy find
" Plug 'ctrlpvim/ctrlp.vim'

" Dev icons
Plug 'ryanoasis/vim-devicons'

" Show git icons in file viewer
Plug 'Xuyuanp/nerdtree-git-plugin'

" File explorer highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Indent color
Plug 'nathanaelkane/vim-indent-guides'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Vim quick-fix
Plug 'romainl/vim-qf'

" Fuzzy file
Plug 'junegunn/fzf.vim'

" Pandoc
" Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" MediaWiki
Plug 'chikamichi/mediawiki.vim'

" Grammarly
Plug 'dpelle/vim-languagetool'

" twitvim
Plug 'twitvim/twitvim'

" wikieditor
Plug 'aquach/vim-mediawiki-editor'
call plug#end()

" Colour scheme
colorscheme gruvbox

""""""""""""""""""""""""""'""""""""
"                                 "
"      SOME BASIC HIGHLIGHTS      "
"                                 "
"""""""""""""""""""""""""""""""""""

" Current cursor line number
hi CursorLineNr cterm=bold ctermfg=214 ctermbg=235

" Cursor line number
" hi Comment cterm=italic term=italic gterm=italic ctermbg=235

" Run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Custom tsserver
let g:ycm_tsserver_binary_path="/Users/acagastya/.config/yarn/global/node_modules/.bin/tsserver"

" Open File explorer if no files were opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""
"                        "
"      KEY BINDINGS      "
"                        "
""""""""""""""""""""""""""

" Clear highlights
nnoremap <CR> :noh<CR><CR>

" Mappings for moving lines and preserving indentation
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap zj :m .+1<CR>==
nnoremap zk :m .-2<CR>==
vnoremap zj :m '>+1<CR>gv=gv
vnoremap zk :m '<-2<CR>gv=gv

" Treat long lines as break lines
" https://github.com/nikolalsvk/dotfiles/blob/master/.vimrc#L54
map j gj
map k gk

" mapping backspace
set backspace=indent,eol,start

" Open File manager
nmap ,m :NERDTreeToggle<CR>

" Toggle commentary
vmap // :Commentary<CR>
nmap // :Commentary<CR>

" Format document
nnoremap =  :Prettier<CR>

" Git Gutter Preview
nmap diff <Plug>(GitGutterPreviewHunk)

" Toggle indentation
nmap <C-i> :IndentGuidesToggle<CR>

" Window resize
" nmap wi= :vert resize +3<CR>
" nmap wi- :vert resize -3<CR>
" nmap hi= :resize +3<CR>
" nmap hi- :resize -3<CR>

" Flip horizontal-vertical
nmap ths <C-w>t<C-w>H
nmap tvs <C-w>t<C-w>K

" Number mapping for 0$^
noremap z0 $
noremap z9 ^
noremap z8 0

" whitespace
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,space:·,eol:`

" Opt arrow navigation
" imap <A-LEFT> b
" imap <A-right> e
" nnoremap <A-LEFT> b
" nnoremap <A-RIGHT> e

" Auto-bracket matching
" inoremap " ""<left>
" inoremap "<Esc> "<Esc>i<right>
" inoremap "" ""<left>

" inoremap ' ''<left>
" inoremap '<Esc> '<Esc>i<right>
" inoremap '' ''<left>

" inoremap ( ()<left>
" inoremap () ()<left>
" au FileType js,ts inoremap [ []<left>
" au FileType js,ts inoremap [] []<left>
" au FileType js,ts inoremap {} {  }<left><left>
" au FileType js,ts inoremap {<CR> {<CR>}<Esc>O

"""""""""""""""""""""""""""""""""""""""
"                                     "
"      Configurations of plugins      "
"                                     "
"""""""""""""""""""""""""""""""""""""""


" Something for fuzzy files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Indent colour on startup
" let g:indent_guides_enable_on_vim_startup = 1


let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }
let g:NERDTreeIgnore = ['^node_modules$']

" time in lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'time' ] ]
      \ },
      \ 'component': {
      \   'time': '%{strftime("%H:%M")}'
      \ },
      \ }

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()


function! SFX()
  :silent :%s/\(.\+\)|url[ ]*=[ ]*/\1\r|url=/ge
  :silent :%s/^|url[ ]*=[ ]*/|url    = /ge

  :silent :%s/\(.\+\)|pub[ ]*=[ ]*/\1\r|pub=/ge
  :silent :%s/^|pub[ ]*=[ ]*/|pub    = /ge

  :silent :%s/\(.\+\)|date[ ]*=[ ]*/\1\r|date=/ge
  :silent :%s/^|date[ ]*=[ ]*/|date   = /ge

  :silent :%s/\(.\+\)|lang[ ]*=[ ]*/\1\r|lang=/ge
  :silent :%s/^|lang[ ]*=[ ]*/|lang   = /ge

  :silent :%s/\(.\+\)|title[ ]*=[ ]*/\1\r|title=/ge
  :silent :%s/^|title[ ]*=[ ]*/|title  = /ge

  :silent :%s/\(.\+\)|author[ ]*=[ ]*/\1\r|author=/ge
  :silent :%s/^|author[ ]*=[ ]*/|author = /ge

  :silent :%s/\(date   = .\+\d\d\d\d\)}}/\1\r}}/ge

  :%s/cat\(egory\)\?: */Category:/gie
endfunction

:command! Ss call SFX()

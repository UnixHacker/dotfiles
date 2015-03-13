
set nocompatible              " be iMproved, required
filetype off                  " required

set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'chrisbra/csv.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'jszakmeister/vim-togglecursor'
Plugin 'bling/vim-airline'
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Valloric/vim-operator-highlight'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'guns/xterm-color-table.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'junegunn/limelight.vim'
Plugin 'dietsche/vim-lastplace'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/tmuxline.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/vimshell.vim'
"Plugin 'jalcine/cmake.vim'
Plugin 'tpope/vim-obsession'
Plugin 'thinca/vim-quickrun'
"Plugin 'Soares/longline.vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-sensible'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-abolish'
Plugin 'gilligan/vim-lldb'
Plugin 'ogier/guessindent'
Plugin 'SirVer/ultisnips'
Plugin 'vim-jp/cpp-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bruno-/vim-man.git'
Plugin 'godlygeek/tabular'
Plugin 'szw/vim-ctrlspace'

" Color schemes
Plugin 'tomasr/molokai.git'

call vundle#end()            " required
filetype plugin indent on    " required


"------------------------------------------------------------

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
"


" General Settings {{{
"set regexpengine=1          " set old regexp engine
set noswapfile              " No swap files
set hidden                  " hide buffer without notice
set hlsearch                " highlight the last searched term
"set virtualedit=all         " let us walk in limbo
set cpoptions+=$            " dollar sign while changing
set foldmethod=marker       " folds on marks
set nowrap                  " don't wrap lines
set textwidth=120            " set expected line width to 80
set clipboard=unnamed       " for simplified clipboard copy/paste
set noshowmode              " hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowcmd               " disable blinking command feedback in bottom-right corner
set mouse=c                 " enable mouse to get scrolling
set vb t_vb=                " No visual bell
set pumheight=30            " Limit popup menu height
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 " space for tabs by default
set smarttab
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif"
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif

set confirm                 " Raise dialog if unsaved changes
set noincsearch

" Open QuickFix horizontally with line wrap and not avoiding long lines
au FileType qf wincmd J | setlocal wrap textwidth=0

" Preview window with line wrap and not avoiding long lines
au WinEnter * if &previewwindow | setlocal wrap textwidth=0 | endif

set wildignore+=CMakeFiles  " add ignored extension
set wildignore+=*.pyc       " add ignored extension
set wildmode=list:longest,full
set smartcase
set bg=dark
set noerrorbells
set backspace=indent,eol,start
nmap _Y 	:w! ~/.vim_copybuf<CR>
vmap _Y 	:w! ~/.vim_copybuf<CR>
nmap _P 	:r ~/.vim_copybuf<CR>
nmap _T 	:r ~/.vim_template<CR>
nmap gr :tabp<CR>

set tags=./tags;,/home/priley/.vim/tags/user.include.tags
set hlsearch


" }}}


" Airline Setup {{{
"let g:airline_theme = 'solarized'
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#whitespace#enabled=0
" }}}


" delimitMate Setup {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_quotes = "\" '"
" }}}

" YouCompleteMe Setup {{{
"set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1   "add keywords to completion database
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}
nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
hi YcmErrorSection term=reverse cterm=reverse gui=reverse
" }}}

" Ultisnips Setup {{{
let g:UltiSnipsExpandTrigger = '<c-a>'
let g:UltiSnipsSnippetsDir = "~/.dotfiles/snips"
" }}}

" NERDTree Setup {{{

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.egg-info$', '\.DS_Store$', '^Session\.vim']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1

" Map NERDTreeToggle to convenient key
"nnoremap <silent> <c-n> :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTreeToggle<CR>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>

" }}}

" CtrlP Setup {{{
"nnoremap <silent> <space> :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPBuffer<cr>
" }}}


" ClangFormat Setup {{{
let g:clang_format#code_style = "Google"

"Not supported in current clang-format version
"\ "AllowShortLoopsOnASingleLine": "false",
"\ "AllowShortBlocksOnASingleLine" : "false",
"\ "AllowShortFunctionsOnASingleLine": "None",
"\ "AllowShortIfStatementsOnASingleLine": "false",
let g:clang_format#style_options = {
            \ "AccessModifierOffset": -4,
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "DerivePointerBinding": "false",
            \ "PointerBindsToType": "false",
            \ "BinPackParameters" : "false",
            \ "ColumnLimit": 120,
            \ "TabWidth": 4,
            \ "IndentCaseLabels": "false",
            \ "BreakBeforeBraces": "Allman",
            \ "Standard": "C++11" }
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" GuessIndent Setup {{{
"au BufReadPost * :GuessIndent
" }}}

" Indent Guides Setup {{{
let g:indent_guides_enable_on_vim_startup = 0
" }}}

" Undo tree Setup {{{
nnoremap <leader>u :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif
" }}}

" Tagbar Setup {{{
nnoremap <leader>t :TagbarToggle<cr>
" }}}

" Cmake Setup {{{
"let g:cmake_build_dirs = [ "build", "debug", "release" ]
"let g:cmake_build_shared_libs = 0
"let g:gmake_install_prefix = "$HOME/cmake_install"
" }}}

" vim-man Setup {{{
map <leader>k <Plug>(Man)
map K <Plug>(Man)
" }}}

" BufExplorer Setup {{{
let g:bufExplorerFindActive=0 
" }}}

" CtrlSpace Setup {{{
nnoremap <leader><space> :CtrlSpace<cr>
" }}}




nnoremap <leader>q :cnext<cr>
nnoremap <leader>w :cprev<cr>



set foldlevelstart=20
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=marker
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

let &t_ti.="\e[0 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[0 q"
let &t_te.="\e[5 q"

nnoremap gb :bnext<cr>
hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd BufEnter * silent! lcd %:p:h



set makeprg=build

"colorscheme molokai



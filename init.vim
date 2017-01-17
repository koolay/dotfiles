" ######################################################################################################################
" ### Author : koolay
" ######################################################################################################################
filetype off

" ======================================================================================================================
" 1.0 Plugin manager (Plug) settings
" ======================================================================================================================
"{{{
" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
call plug#begin('~/.config/nvim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.1 Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" theme {
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
" }

Plug 'mhinz/vim-startify'

" Automatically closing pair stuff
Plug 'cohama/lexima.vim'

" Snippet support (C-j)
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'Valloric/YouCompleteMe'

" { deoplete.nvim
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    " neocomplete like
    set completeopt+=noinsert
    " deoplete.nvim recommend
    set completeopt+=noselect
    let g:deoplete#enable_at_startup = 1
    let g:tern_request_timeout = 1
    let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#use_cache = 1

    "Add extra filetypes
    let g:tern#filetypes = [
                    \ 'jsx',
                    \ 'javascript.jsx',
                    \ 'vue'
                    \ ]
    " remap Ultisnips for compatibility for YCM
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
"}

" Commenting support (gc)
Plug 'tpope/vim-commentary'
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'

" airline {  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="powerlineish"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" }

Plug 'easymotion/vim-easymotion'

Plug 'AndrewRadev/splitjoin.vim'
" {
    let g:splitjoin_split_mapping = ''
    let g:splitjoin_join_mapping = ''
    noremap sj :SplitjoinJoin<cr>
    noremap sk :SplitjoinSplit<cr>
"}

Plug 'thinca/vim-quickrun'

"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'ervandew/supertab'

" lint Asynchronous maker and linter (needs linters to work) {}
Plug 'benekastah/neomake'
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>
function ESLintFix()
  silent execute "!eslint --fix %"
  edit! %
endfunction
nnoremap <S-F> :call ESLintFix()<CR>

let g:neomake_open_list = 1
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake
let g:neomake_message_sign = {'text': '>', 'texthl': 'NeomakeMessageSign'}
let g:neomake_warning_sign = {'text': '!', 'texthl': 'Identifier'}
let g:neomake_error_sign   = {'text': 'X', 'texthl': 'Statement'}
let g:neomake_info_sign    = {'text': 'i', 'texthl': 'NeomakeInfoSign'}

" }



" ---------------------------------------------------------------------------------------------------------------------
" JS (ES6, React) {{{
" ---------------------------------------------------------------------------------------------------------------------

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'
" javascript-libraries-syntax {
Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'vue'
" }
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
" JSX syntax
Plug 'mxw/vim-jsx'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
" Autocomplete using flow (npm install -g flow-bin)
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" tern {
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
autocmd FileType javascript noremap <leader>d :TernDef<CR>
autocmd FileType javascript noremap <leader>ref :TernRefs<CR>
autocmd FileType javascript noremap <leader>re :TernRename<CR>
autocmd FileType javascript noremap <leader>td :TernDoc<CR>
" }

" JS Documentation comments
Plug 'heavenshell/vim-jsdoc'
" {
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
nmap <silent> <C-d> ?function<cr>:noh<cr><Plug>(jsdoc)
"}


" vue {
Plug 'posva/vim-vue'
autocmd BufRead,BufNewFile *.vue set ft=javascript

"}

"}}}
"
" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS {{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }
"}}}
"
" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------

" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'
"}}}
"

" ---------------------------------------------------------------------------------------------------------------------
" Unite fuzzy searcher {{{
" ---------------------------------------------------------------------------------------------------------------------
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes n \| ./install' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>
"}}}
"

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'jistr/vim-nerdtree-tabs'
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'
Plug 'alvan/vim-closetag'
"{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue,*.jsx"
"}

"}}}

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Fugitive
Plug 'tpope/vim-fugitive'
" Git log viewer (Gitv! for file mode)
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
"}}}


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" General {
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

" }

" UI {
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line
    set termguicolors
    set background=light
    let g:gruvbox_bold=1
    let g:gruvbox_contrast_dark="hard" "soft, medium and hard
    let g:gruvbox_contrast_light="hard"
    color gruvbox
    set guifont=Consolas:h16

    let g:solarized_termcolors=256
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set wildignore=*.swp,*.bak,*.pyc,*.class
    set noswapfile
    set nobackup
" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }


" Key (re)Mappings {

    let mapleader = ','
    let maplocalleader = '_'

    " ,ev : open vimrc
    nnoremap <leader>ev :e $MYVIMRC<cr>

    " ,rv : reload vimrc
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h


    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier formatting
    nnoremap <silent> <leader>q gwip
    " NerdTree {

    nmap <leader>nt :NERDTreeFind<CR>
    nnoremap <c-e> :NERDTreeToggle<cr>
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " }
    
    " Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }
    "
  map <S-H> gT
  map <S-L> gt
"

" -----------------------------------------------------
" golang {
  let g:go_play_open_browser = 0
  let g:go_fmt_command = "gofmt"
  let g:go_fmt_fail_silently = 1
  let g:go_snippet_engine = "neosnippet"
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_doc_keywordprg_enabled = 0

  let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  autocmd FileType go nmap gd <Plug>(go-def)
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap  <leader>r  <Plug>(go-run)
  autocmd FileType go nmap  <leader>b  <Plug>(go-build)
  autocmd FileType go nmap  <leader>t  <Plug>(go-test)
  autocmd FileType go nmap  <leader>tc  <Plug>(go-coverage)
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" }
  
" -----------------------------------------------------


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
Plug 'jparise/vim-graphql'
Plug 'mhinz/vim-startify'

Plug 'ambv/black',                   { 'for': 'python' }

" Automatically closing pair stuff
Plug 'cohama/lexima.vim'

" Snippet support (C-j)
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}

" { deoplete.nvim
Plug 'roxma/nvim-yarp'"

" ******************************************
" COC:
" ******************************************
"
let g:coc_global_extensions = [
    \'coc-tsserver',
    \'coc-tslint-plugin',
    \'coc-eslint',
    \'coc-json',
    \'coc-snippets',
    \'coc-prettier',
    \'coc-css',
    \'coc-yank',
    \'coc-git',
    \'coc-python',
    \]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> U :call <SID>show_documentation()<CR>


"--------ale---------------
Plug 'w0rp/ale'
let g:ale_python_flake8_options = '--max-line-length 120'
let g:python_black_options = "--line-length=120 --skip-string-normalization"
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'typescript': ['tsserver', 'tslint'],
      \   'typescript.tsx': ['tsserver', 'tslint'],
      \   'html': [],
      \   'go': ['golangci-lint'],
      \}

let g:ale_fixers = {
      \ 'go': ['gofmt', 'goimports'],
      \ 'markdown': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'
let g:ale_fix_on_save = 1
let g:ale_list_window_size = 3
" Use quickfix list
let g:ale_set_quickfix = 1
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1
" better whitespace
let g:strip_whitespace_on_save = 1
" black
let g:black_linelength = 120
let g:LanguageClient_diagnosticsEnable = 0
let g:black_skip_string_normalization = 1
let g:LanguageClient_serverCommands = { 'go': ['gopls'], 'python': ['pyls'] }

"----------------------------------------------
"
"------------------------------------------------
" golang
"-----------------------------------------------
Plug 'fatih/vim-go'

let g:go_code_completion_enabled = 0
let g:go_auto_type_info = 0
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_def_mapping_enabled = 0
let g:go_get_update = 1
let g:go_metalinter_enabled = []
let g:go_metalinter_autosave = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
"----------------------end-----------------------

"Add extra filetypes
"
" remap Ultisnips for compatibility for YCM
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
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

Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
"
" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS {{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
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
" tagbar {{{

  Plug 'majutsushi/tagbar'
  let g:tagbar_left = 1
  let g:tagbar_width = 35
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 0
  let g:tagbar_indent = 2
  let g:tagbar_show_linenumbers = 1
  " let g:tagbar_iconchars = ['►', '▼']
" }}}

" ---------------------------------------------------------------------------------------------------------------------
" Unite fuzzy searcher {{{
" ---------------------------------------------------------------------------------------------------------------------
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes n \| ./install' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~30%' }

let g:fzf_action = {
      \ 'ctrl-n': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
"}}}
"

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
" NERDTree {{{
        Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
        Plug 'jistr/vim-nerdtree-tabs'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endfunction
        " toggle nerd tree
        nmap <silent> <leader>k :call ToggleNerdTree()<cr>
        " find the current file in nerdtree without needing to reload the drawer
        nmap <silent> <leader>y :NERDTreeFind<cr>
        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : '*',
        \ "Staged"    : '+',
        \ "Untracked" : '✭',
        \ "Renamed"   : '➜',
        \ "Unmerged"  : '═',
        \ "Deleted"   : '✖',
        \ "Dirty"     : '*',
        \ "Clean"     : '✔︎',
        \ 'Ignored'   : '☒',
        \ "Unknown"   : '?'
        \ }
" }}}

" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'

let g:buftabline_show=1
let g:buftabline_numbers=1

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

nnoremap <Leader>gb :Gblame -w<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>

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
"
    set encoding=UTF-8
    set tabpagemax=15               " Only show 15 tabs
    set noshowmode                    " Display the current mode
    set cursorline                  " Highlight current line
    set termguicolors
    set background=dark
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
    " set hlsearch                    " Highlight search terms
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
    nnoremap <leader>wo :only<CR>
    nnoremap <leader>ws :split<CR>
    nnoremap <leader>wn :tabnew<CR>
    nnoremap <leader>wv :vsplit<CR>

    " clear highlighted search
    nnoremap <space> :noh<cr>
    " activate spell-checking alternatives. typing: zg, to ignore file
    nmap ;s :set invspell spelllang=en<cr>
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
    " Start nerdtree when opening vim
    let g:nerdtree_tabs_open_on_console_startup = 1

    " Don't start nerdtree when opening a diff
    let g:nerdtree_tabs_no_startup_for_diff = 1

    " Sync scroll and cursor across tabs
    let g:nerdtree_tabs_synchronize_view = 1

    " Don't focus nerdtree when changing tabs
    let g:nerdtree_tabs_focus_on_files = 1
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

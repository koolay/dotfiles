set runtimepath^=~/.vim/bundle/ag
set nospell
" Use the Solarized Dark theme
set background=light
" Don’t blink cursor in normal mode
set guicursor=n:blinkon0
" Better line-height
set linespace=8
let NERDTreeQuitOnOpen=0
cmap w!! w !sudo tee > /dev/null %

" theme
set guifont=Consolas:h16
colorscheme solarized
"colorscheme fruity
"colorscheme ir_black
"colorscheme molokai
"colorscheme peaksea

autocmd FileType javascript noremap <buffer> <leader>r :!standard --fix %<CR><CR>
set autoread

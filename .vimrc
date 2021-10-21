set nocompatible
filetype off

" Plugin definition
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'yegappan/mru'
Plugin 'hungwenchien/cscope.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/neomru.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'guns/xterm-color-table.vim'
Plugin 'rking/ag.vim'
Plugin 'simplyzhao/cscope_maps.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'finbarrocallaghan/highlights.vim'
Plugin 'vim-scripts/desert-warm-256'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
"Plugin 'wookayin/fzf-ripgrep.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" Plugin 'Vimjas/vim-python-pep8-indent'

call vundle#end()

set viminfo=

" Print full path
command -nargs=0 F :echo expand('%:p')

" Switching Coding style command
command StyleFuchsia :set ts=4 | set sw=4 | set et
command StyleLinux :set ts=8 | set sw=8 | set noet

let g:NERDTreeWinPos = "right"
let g:tagbar_left = 1
let mapleader = ""

" clang_format style
" linux
" let g:clang_format#style_options = {"IndentWidth": 8, "TabWidth": 8, "UseTab": "Always", "ColumnLimit": 120, "BreakBeforeBraces": "Linux", "IndentCaseLabels": "false", "BasedOnStyle": "LLVM"}
" fiasco
let g:clang_format#style_options = {"IndentWidth": 2, "TabWidth": 2, "UseTab": "Never", "ColumnLimit": 80,
\ "BreakBeforeBraces": "Linux", "IndentCaseLabels": "false", "AllowShortIfStatementsOnASingleLine": "false",
\ "AllowShortFunctionsOnASingleLine": "false", "AlignConsecutiveAssignments": "true", "AlignConsecutiveDeclarations": "true" }

" VIM options
set encoding=utf-8
set history=200
"set bs=2
set wildmenu
set autoindent
set hlsearch
set cursorline
set incsearch
set nu
set showcmd
set cinoptions+=:0
set laststatus=2
set background=dark
set ignorecase
set t_Co=256
" set list
set listchars=tab:>-
syntax on

" Coding style
" set noet
"set expandtab

if has('gui_running')
colorscheme jellybeans
set guioptions =
else
" :highlight (to list all highlight colors)
" help hi for more detail
hi Search term=reverse ctermfg=0
hi Search cterm=underline ctermbg=236 ctermfg=13
hi LineNr ctermfg=245 guifg=Grey60
hi CursorLineNr ctermfg=255 guifg=Grey100
"hi Visual ctermfg=255 ctermbg=240
hi Visual ctermbg=239
hi TabLineFill ctermfg=black
hi TabLine ctermfg=black ctermbg=gray
hi TabLineSel ctermfg=black ctermbg=white
hi Statement ctermfg=blue
hi Comment ctermfg=243
hi Constant ctermfg=green
hi Identifier ctermfg=magenta
hi PreProc ctermfg=darkblue
hi Function ctermfg=yellow
hi Type ctermfg=215
hi MatchParen term=reverse ctermbg=DarkGrey
hi CursorLine term=underline cterm=bold ctermbg=236 guibg=Grey25
hi SpecialKey ctermfg=239
hi QuickFixLine ctermbg=DarkGrey
hi cFormat ctermfg=147
hi DiffDelete term=bold ctermfg=24 ctermbg=24 gui=bold guifg=Blue guibg=DarkCyan
hi DiffAdd term=bold ctermfg=123 ctermbg=24 guibg=DarkBlue
hi DiffText term=bold cterm=bold ctermfg=white ctermbg=172 gui=bold guibg=Red
hi DiffChange term=bold ctermbg=137 guibg=DarkMagenta
hi Folded term=standout ctermfg=195 ctermbg=237 guifg=Cyan guibg=DarkGrey
endif

" Cscope
"nnoremap * :keepjumps normal! *<cr>
"nnoremap n :keepjumps normal! n<cr>
"nnoremap N :keepjumps normal! N<cr>
"set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
"nnoremap <c-]> : lcs f g <cword><CR>:lw<CR>
" nnoremap <leader>fs :lcs f s <cword><CR>:lw<CR>
" nnoremap <leader>fg :lcs f g <cword><CR>:lw<CR>
" nnoremap <leader>fd :lcs f d <cword><CR>:lw<CR>
" nnoremap <leader>fc :lcs f c <cword><CR>:lw<CR>
" nnoremap <leader>ft :lcs f t <cword><CR>:lw<CR>
" nnoremap <leader>fe :lcs f e <cword><CR>:lw<CR>
" nnoremap <leader>ff :lcs f f <cword><CR>:lw<CR>
" nnoremap <leader>fi :lcs f i <cword><CR>:lw<CR>

set nocscopeverbose
let g:cscope_silent = 1
nnoremap zs :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap zg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap zd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap zc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap zt :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap ze :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap zf :call CscopeFind('f', expand('<cword>')); lw<CR>
nnoremap zi :call CscopeFind('i', expand('<cword>'))<CR>
nnoremap <leader>q : ccl \| lcl <CR>

" Key definition
map <f1> :tab split<CR>
map <f2> :%s/\s\+$//g<CR>
map <f3> :TagbarToggle<CR>
map <f4> :NERDTreeToggle<CR>
map <f5> :CscopeUpdateFull<CR>
map <f6> :MRU<CR>
"map <f3> :set nu<CR>
"map <f4> :set nonu<CR>
"map <f3> :tabprevious<CR>
"map <f4> :tabnext<CR>
"map <f5> :!cscope -b -k<CR>:cs reset<CR><CR>
"map 2 :tabclose<CR>
map J : tabprevious<CR>
map K : tabnext<CR>
" map <leader>y "+y
" map <leader>p "+p
" map <C-a> <esc>ggVG<CR>
map <C-z> :set et\|retab<CR>

" SWP or backup files settings
set nobackup
set noswapfile
" set directory=~/.vim/swp//
" set backupdir=~/.vim/backup//

" Ag, the silver searcher
"map <C-\> :execute "Ag " . expand("<cword>") <CR>
"nnoremap <leader>ag :execute "LAg " . expand("<cword>") <CR>

nnoremap <silent> <C-f> :Files!<CR>
nnoremap <C-p> :GFiles!<Cr>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


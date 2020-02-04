" NERDTree - https://github.com/scrooloose/nerdtree.git
" Solarized - https://github.com/altercation/vim-colors-solarized.git
" fugitive.vim - https://github.com/tpope/vim-fugitive.git
" Vim REST - https://github.com/diepm/vim-rest-console

execute pathogen#infect()

"Enable syntax highlighting
syntax on

"Enable plugin loading and file indenting on file load
filetype plugin indent on

"Colorscheme to solarized dark
set background=dark
colorscheme solarized

"Highlights current line
set cursorline
"Show line numbers on the gutter
set number
"Show line and column number of the cursor on the statusline
set ruler
"Show (partial) command on the status line
set showcmd
"Show possible completions above command line
set wildmenu

"Enable scrolling and resizing with mouse
set mouse=a
set ttymouse=xterm2

"Tabs fun: http://tedlogan.com/techblog3.html
"Number of spaces used to render each tab
set tabstop=4 
"Nummber of spaces inserted when tab is pressed
set softtabstop=4 
"Insert spaces when tab is pressed
set expandtab 
"Number of spaces to use on indent operations like '<<' and '>>
set shiftwidth=4 
"Copy indent from current line when starting a new line
set autoindent

" JS indent
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" JSON indent
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

"Remap Q to run last used macro
nnoremap Q @@

"--------------------

"CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim

"vim-jsbeautify config
map <c-f> :call JsBeautify()<cr>


"Enhances :find
set path+=**

"The Silver Searcher (https://github.com/ggreer/the_silver_searcher)
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ bower_components\ --ignore\ node_modules\ --ignore\ .git

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! ":*\b<C-R><C-W>\b"<CR>:cw<CR>

"Changes highlight for string
hi link String Directory

"TESTS fro JAVA plugin
autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:JavaComplete_ClasspathGenerationOrder = ['Gradle', 'Eclipse', 'Maven']


let g:jsx_ext_required = 0
:set enc=utf-8

let g:user_emmet_leader_key='<Tab>'

"vim-slime config

let g:slime_target = "tmux"

"vim-slime config end

"Send to repl
"nmap <Tab><Tab> :w<CR> :silent !tmux send-keys -t \%12 "(load-file \"%\")" Enter<CR>:redraw!<CR>
"
function GrepWithClojureKeyWord(word)
    if a:word =~ '^:'
        silent execute "grep! '" . a:word . "\\b'"
        copen
        redraw!
    else
        silent execute "grep! '\\b" . a:word . "\\b'"
        copen
        redraw!
    end
endfunction

nnoremap K :call GrepWithClojureKeyWord('<C-R><C-W>')<cr>

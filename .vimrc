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
set background=light
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

"set vertical diff
set diffopt+=vertical

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
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" JSON indent
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

"Remap Q to run last used macro
nnoremap Q @@

"Map <Tab><Tab> to save file
map <Tab><Tab> :w<CR>

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

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"Changes highlight for string
hi link String Directory

"TESTS fro JAVA plugin
autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:JavaComplete_ClasspathGenerationOrder = ['Gradle', 'Eclipse', 'Maven']


let g:jsx_ext_required = 0
:set enc=utf-8

let g:user_emmet_leader_key='<Tab>'

" coc

set encoding=utf-8

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Use K to show documentation in preview window
nnoremap <silent> gk :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

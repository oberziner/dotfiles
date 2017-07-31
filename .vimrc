"Plugins installed:
" Pathogen - https://github.com/tpope/vim-pathogen
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

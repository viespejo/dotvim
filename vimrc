runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"no vi compatible
set nocp
"backspace
set backspace=indent,eol,start
"show number
set number
"syntax highlighting
syntax on
"color
colo desert
"php folding
let php_folding = 3
"projects
let g:proj_flags = "imstgv"
"sql type default
let g:sql_type_default = 'mysql'
"SuperTab
"let g:SuperTabDefaultCompletionType = 'context'
"deshabilitar matchparen highlighting
let loaded_matchparen = 1
"shift commands
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
"indent
set autoindent
filetype indent plugin on
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"set smartindent
" wrap
set nowrap
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999
" Use UTF-8.
set encoding=utf-8
" searching
set incsearch
set ignorecase
set smartcase
"set hlsearch
"command line
set wildmode=list:longest
set wildmenu
set showcmd
"highlight line
"set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
" Error bells are displayed visually.
set visualbell
set nobackup " make backup files
"set backupdir=~/.vim/backup " where to put backup files
set noswapfile
"set directory=~/.vim/tmp " directory to place swap files in
set fileformats=unix,dos,mac " support all three, in this order
set mouse=a " use mouse everywhere
"statusline 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
" taglist configuration
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_Auto_Highlight_Tag = 0
let Tlist_php_settings = 'php;c:class;f:function'
let Tlist_Exit_OnlyWindow = 1
"let treeExplVertical = 1
"let treeExplNoList = 1
"let treeExplWinSize = 30
" auto switch to folder where editing file
autocmd BufEnter * silent! cd %:p:h
"mappings
source ~/.vim/mapping.vim
"session management
source ~/.vim/session.vim
"abbreviations
source ~/.vim/abbreviations.vim

"Editing Help:  {{{
"nnoremap <leader>u :GundoToggle<CR> "Python 2.4. Bastards.
set spelllang=en_gb
"set spell
"}}}

"Searching: {{{
set incsearch   "Start searching as we type
set hlsearch    "Highlight matches
"}}}

"Spaces And Tabs:   {{{
set tabstop=4   "Visual spaces per tab
set shiftwidth=4
set expandtab   "Tabs -> Spaces
"}}}

"Syntax And Colour: {{{
set background=dark
"colorscheme solarized

filetype plugin on  "Allows detection of filetype
filetype indent on  " and loading of indent rules.
syntax enable       "Syntax highlighting, because colour is awesome!
"}}}

"UI:    {{{
set cursorline  "Highlight the current line
set lazyredraw  "Prevents persistant redrawing
set modelines=1 "Make vim check the end of the file for formatting flags
set number      "Line numbers
set showcmd     "Shows command
set showmatch   "Shows matching brackets
set wildmenu    "Show a menu for tab completion
"}}}

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below. If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 shortcuts                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap jj <Esc>       " Quickly get out of insert mode 
imap ww <Esc>:w<CR>     " Quickly get out of insert mode and write file
let mapleader = ","     " Choose a nicer leader-key
" Use "ö"-key like ":"
nnoremap ö :
" Use "ä"-key like "/"
nnoremap ä /

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
 
" use w!! to save a file with root-rights
cmap w!! w !sudo tee % >/dev/null



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Editing behaviour                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmatch                   " Show matching brackets.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
"set autowrite                  " Automatically save before commands like :next and :make
"set hidden                     " Hide buffers when they are abandoned
set mouse=a                     " Enable mouse usage (all modes)
set smartindent                 "	Do smart autoindenting when starting a new line.
set showmode                    " always show what mode we're currently editing in
" set nowrap                    " don't wrap lines
set tabstop=2                   " a tab is four spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
" set virtualedit=all           " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set gdefault                    " search/replace "globally" (on a line) by default
" set listchars=tab:▸\ ,trail:·,extends:#,nbsp:· " make the invisible chars visible
set nolist                      " don't show invisible characters by default, but it can be enabled for some file types 
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Editor layout                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                  " use 256 colors in terminal
colorscheme grb256            " use the given colorscheme/theme
syntax on                     " syntax highlighting
set background=dark           " If using a dark background within the editing area and syntax highlighting turn on this option as well
set termencoding=utf-8        " Encoding used for the terminal.
set encoding=utf-8            " Sets the character encoding used inside Vim.
set lazyredraw                " don't update the display while executing macros
set laststatus=2              " always put a status line in, even if there is only one window
set cmdheight=2               " use a status bar that is 2 rows high
set ruler                     " show ruler"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Vim behaviour                                  " 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden                      " hide buffers instead of closing them this means that the current buffer can be put
                                " to background without being written; and that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the quickfix window instead of opening new buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set undofile                    " keep a persistent backup file
set undodir=~/.vim/.undo,~/tmp,/tmp
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files, who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp " store swap files in one of these directories (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
" set ttyfast                   " always use a fast terminal
" set cursorline                " underline the current line, for quick orientation
" open a file at the last edited location:
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NERDTree stuff                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd vimenter * NERDTree " open a NERDTree automatically when vim starts up
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" let NERDTreeCaseSensitiveSort=1
let NERDTreeAutoDeleteBuffer=1

" if you fire up vim without open a file => focus on NERDTree, becouse its already running by now
if bufnr("[No Name]") != -1
  autocmd vimenter * wincmd p
endif

" shortcut to toggle NERDTree on/off
map <F4> :NERDTreeToggle<CR>
inoremap <F4> <Esc>:NERDTreeToggle<CR>a

" shortcut to toggle Undotree on/off
nnoremap <F5> :UndotreeToggle<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vundle stuff                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off " must be declared before Vundle stuff

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" === original repos on github ===

" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

" Insert or delete brackets, parens, quotes in pair.
Bundle 'jiangmiao/auto-pairs'

" It handles syntax, indenting, compiling, and more. Also included is support for CoffeeScript in Haml and HTML.
Bundle 'kchmck/vim-coffee-script'

" browsing the tags of source code files. It provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. This means that for example methods in C++ are displayed under the class they are defined in.
Bundle 'majutsushi/tagbar'

" shows all added, deleted and modified lines since the last commit via Vim its sign column.
" For more info: :h signify-options
Bundle 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight = '<leader>gh'
let g:signify_update_on_bufenter = 1
let g:signify_cursorhold_normal = 1
let g:signify_cursorhold_insert = 1

" visually displaying indent levels in Vim.
" The default mapping to toggle the plugin is <Leader>ig
Bundle 'nathanaelkane/vim-indent-guides'

" provides syntax and indent plugins.
Bundle 'pangloss/vim-javascript'

" provides insert mode auto-completion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'

" The NERD tree allows you to explore your filesystem and to open files and directories.
Bundle 'scrooloose/nerdtree'

" Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any resulting errors to the user
Bundle 'scrooloose/syntastic'

" Vim sugar for the UNIX shell commands that need it the most. Commands include:
" :Unlink: Delete a buffer and the file on disk simultaneously.
" :Remove: Like :Unlink, but doesn't require a neckbeard.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Chmod: Change the permissions of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :SudoWrite: Write a privileged file with sudo.
" :W: Write every open window. Handy for kicking off tools like guard.
Bundle 'tpope/vim-eunuch'

" a Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

" Ruby on Rails power tools
Bundle 'tpope/vim-rails'

" A dark vim color scheme for 256-color terminals.
Bundle 'Lokaltog/vim-distinguished'

" exploring the source code based on "tags", and it works like the context window of "Source Insight". 
" Open the Source Explorer window with :SrcExpl or :SrcExplToggle or map these commands to keys in your .vimrc.
Bundle 'wesleyche/SrcExpl'


" Ultimate auto-completion system
"Bundle 'Shougo/neocomplcache'

"A vim plugin for running your Ruby testsx:
"Bundle 'skalnik/vim-vroom'

"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}


" === vim-scripts repos ===

" Fast and Easy Find and Replace Across Multiple Files 
" <Leader>vv  - Grep for the word under the cursor, match all occurences, like |gstar|
" <Leader>vV  - Grep for the word under the cursor, match whole word, like |star|
" <Leader>va  - Like vv, but add to existing list
" <Leader>vA  - Like vV, but add to existing list
" <Leader>vr  - Perform a global search search on the word under the cursor and prompt for a pattern with which to replace it.
" <Leader>vo  - Select the files to search in and set grep options
Bundle 'EasyGrep'

" Display your undo history in a graph
Bundle 'undotree.vim'

" The shortcut is gs You can google for the word under the cursor in normal mode,
" or you can search for selected text in visual mode.
Bundle 'voogle'

" bring up the history of a given file. It will list the history in the
" window-pane on the left of the screen. If you hit enter it will diff that
" commit against the current revision loaded.
"
" In the log window __gitlog__ the following commands work:
" o           opens the file. This will simply open the file in a new window.
" s           starts a search and opens the search window.
" <cr>        This will open the file and diff it against the window that was active when it was lauched.
"
" In the search window __gitsearch__ the two following commands work:
" o           opens the file. This will simply open the file in a new window.
" <cr>        This will open the file and diff it against the window that was active when it was lauched.
"
" In the Branch window:
" <cr>        This will change the log window to the branch selected. It does not change the current branch of the given repository.
Bundle 'git-log'


" === non github repos === 

" Example
"Bundle 'git://git.wincent.com/command-t.git'


" === Brief help ===

" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ

" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on " must be declared after Vundle stuff

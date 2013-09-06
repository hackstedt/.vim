"                                                                        .---.
"                                                                       /  .  \
"                                                                      |\_/|   |
"                                                                      |   |  /|
"         .------------------------------------------------------------------' |
"        /  .-.                   Sections:                                    |
"       |  /   \                                                               |
"       | |\_.  |                   * Shortcuts                                |
"       |\|  | /|                   * Editing behaviour                        |
"       | `---' |                   * Editor layout                            |
"       |       |                     + Colors and Colorschemes                |
"       |       |                   * Vim behaviour                            |
"       |       |                   * NERDTree stuff                           |
"       |       |                   * Vundle stuff                             |
"       |       |                                                              /
"       |       |-------------------------------------------------------------'
"       \       |
"        \     /
"         `---'



       "-----------------------------------------------------------------------"
       " + - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - + "
       " | <---------------------------------------------------------------> | "
       " / :                                                               : \ "
       " - :                           Shortcuts                           : - "
       " \ :                                                               : / "
       " | <---------------------------------------------------------------> | "
       " + - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - + "
       "-----------------------------------------------------------------------"


" TODO If you get out of insert mode, the coursor jumps 6 chars to the right.
" - Prevent this.
inoremap ff <Esc>       " Quickly get out of insert mode
imap ww <Esc>:w<CR>     " Quickly get out of insert mode and write file
nnoremap ^ <ESC>:w<CR>  " Quickly write file in normal mode
let mapleader = ','     " Choose a nicer leader-key
" Use "ö"-key like ":"
nnoremap ö :
" Use "ä"-key like "/"
nnoremap ä /

map <C-h> <C-w>h        " Easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap ,m4 <C-w>>     " Resize window
nnoremap ,m6 <C-w><
nnoremap ,m8 <C-w>-
nnoremap ,m2 <C-w>+

let i = 1               " More easy window navigation
while i <= 9
  execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile

nnoremap <F8> :m .-2<CR>==          " Move lines of text or a whole block up or down
inoremap <F8> <Esc>:m .-2<CR>==gi   " TODO Better mapping
vnoremap <F8> :m '<-2<CR>gv=gv
inoremap <F7> <Esc>:m .+1<CR>==gi
nnoremap <F7> :m .+1<CR>==
vnoremap <F7> :m '>+1<CR>gv=gv

nnoremap <F5> :UndotreeToggle<cr>    " Shortcut to toggle Undotree on/off



       "-----------------------------------------------------------------------:
       " + - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - + :
       " | <---------------------------------------------------------------> | :
       " / :                                                               : \ :
       " - :                       Editing behaviour                       : - :
       " \ :                                                               : / :
       " | <---------------------------------------------------------------> | :
       " + - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - + :
       "-----------------------------------------------------------------------:


runtime! debian.vim             " This line should not be removed as it ensures that various options are
                                " properly set to work with the Vim-related packages available in Debian.
                                " (It's $VIMRUNTIME/debian.vim; usually just /usr/share/vim/vimcurrent/debian.vim)
set showmatch                   " Show matching brackets.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
set mouse=a                     " Enable mouse usage (all modes)
set smartindent                 " Do smart autoindenting when starting a new line.
set showmode                    " Always show what mode we're currently editing in
set tabstop=2                   " A tab is four spaces
set softtabstop=2               " When hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " Expand tabs by default (overloadable per file type later)
set shiftwidth=2                " Number of spaces to use for autoindenting
set shiftround                  " Use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set autoindent                  " Always set autoindenting on
set copyindent                  " Copy the previous indentation on autoindenting
set number                      " Always show line numbers
set smarttab                    " Insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=4                 " Keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " Highlight search terms
set gdefault                    " Search/replace 'globally' (on a line) by default
set nolist                      " Don't show invisible characters by default, but it can be enabled for some file types
set pastetoggle=<F2>            " When in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented
" set autowrite                 " Automatically save before commands like :next and :make
" set hidden                    " Hide buffers when they are abandoned
" set virtualedit=all           " Allow the cursor to go in to 'invalid' places
" set nowrap                    " Don't wrap lines
" set listchars=tab:▸\ ,trail:·,extends:#,nbsp:· " Make the invisible chars visible



       "-----------------------------------------------------------------------:
       " + - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - + :
       " | <---------------------------------------------------------------> | :
       " / :                                                               : \ :
       " - :                         Editor layout                         : - :
       " \ :                                                               : / :
       " | <---------------------------------------------------------------> | :
       " + - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - + :
       "-----------------------------------------------------------------------:


set termencoding=utf-8          " Encoding used for the terminal.
set encoding=utf-8              " Sets the character encoding used inside Vim.
set lazyredraw                  " Don't update the display while executing macros
set laststatus=2                " Always put a status line in, even if there is only one window
set cmdheight=2                 " Use a status bar that is 2 rows high
set ruler                       " Show ruler
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ \(%{tabpagewinnr(tabpagenr())}\)


"                            Colors and Colorschemes                           "
" ---------------------------------------------------------------------------- "

set t_Co=256                    " Use 256 colors in terminal
syntax enable                   " Syntax highlighting
set background=dark             " If using a dark background within the editing area and syntax highlighting turn on this option as well

let g:solarized_termcolors=256  " Tell solarized to use 256 colors in Terminal

" Use individual colorscheme depending on given fyletype:
let g:colors_name = "nil"
let last_colorscheme = g:colors_name
au BufLeave * let last_colorscheme = g:colors_name
augroup filetype_colorscheme
" REFACT: Make a list/array containing the following filetypes:
  au BufEnter * if &ft == "sass" || &ft == "scss.css" || &ft == "scss" || &ft == "css"
\ |     if last_colorscheme != "distinguished"
\ |       colorscheme distinguished
\ |     endif
\ |   elseif last_colorscheme != "solarized" && &ft != "nerdtree"
\ |     syntax enable | set background=dark | colorscheme solarized
\ |   endif
augroup END

"\ |   ColorHighlight!


       "-----------------------------------------------------------------------:
       " + - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - + :
       " | <---------------------------------------------------------------> | :
       " / :                                                               : \ :
       " - :                         Vim behaviour                         : - :
       " \ :                                                               : / :
       " | <---------------------------------------------------------------> | :
       " + - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - + :
       "-----------------------------------------------------------------------:


set hidden                      " Hide buffers instead of closing them this means that the current buffer can be put
                                " to background without being written; and that marks and undo history are preserved
set switchbuf=useopen           " Reveal already opened files from the quickfix window instead of opening new buffers
set history=1000                " Remember more commands and search history
set undolevels=1000             " Use many muchos levels of undo
set nobackup                    " Do not keep backup files, it's 70's style cluttering
set noswapfile                  " Do not write annoying intermediate swap files, who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp " Store swap files in one of these directories (in case swapfile is ever turned on)
set viminfo='20,\"80            " Read/write a .viminfo file, don't store more than 80 lines of registers
set wildmenu                    " Make tab completion for files/buffers act like bash
set wildmode=list:full          " Show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " Change the terminal's title
set visualbell                  " Don't beep
set noerrorbells                " Don't beep
set showcmd                     " Show (partial) command in the last line of the screen this also shows visual selection info
set nomodeline                  " Disable mode lines (security measure)
if exists('+undofile')          " Keep a persistent backup file
  set undofile
  set undodir=~/.vim/.undo,~/tmp,/tmp
end
" set ttyfast                   " Always use a fast terminal
" set cursorline                " Underline the current line, for quick orientation
" Open a file at the last edited location:
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"augroup myvimrc " Autoload/resource the *vimrc - file after saving it
  "au!
  "au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END



       "-----------------------------------------------------------------------:
       " + - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - + :
       " | <---------------------------------------------------------------> | :
       " / :                                                               : \ :
       " - :                     NERDTree stuff                            : - :
       " \ :                                                               : / :
       " | <---------------------------------------------------------------> | :
       " + - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - + :
       "-----------------------------------------------------------------------:


autocmd vimenter * NERDTree " Open a NERDTree automatically when vim starts up
" Close vim if the only window left open is a NERDTree:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" let NERDTreeCaseSensitiveSort=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowBookmarks=1

" If you fire up vim without open a file => focus on NERDTree, becouse its already running by now
if bufnr("[No Name]") != -1
  autocmd vimenter * wincmd p
endif

" Shortcut to toggle NERDTree on/off
map <F4> :NERDTreeToggle<CR>
inoremap <F4> <Esc>:NERDTreeToggle<CR>



       "-----------------------------------------------------------------------:
       " + - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - \ | / - + :
       " | <---------------------------------------------------------------> | :
       " / :                                                               : \ :
       " - :                      Vundle stuff                             : - :
       " \ :                                                               : / :
       " | <---------------------------------------------------------------> | :
       " + - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - / | \ - + :
       "-----------------------------------------------------------------------:


filetype off " Must be declared before Vundle stuff

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


"                          Original repos on github                            "
" ---------------------------------------------------------------------------- "

" Let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

" Insert or delete brackets, parens, quotes in pair.
Bundle 'jiangmiao/auto-pairs'

" It handles syntax, indenting, compiling, and more. Also included is support for CoffeeScript in Haml and HTML.
Bundle 'kchmck/vim-coffee-script'

" Browsing the tags of source code files. It provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. This means that for example methods in C++ are displayed under the class they are defined in.
Bundle 'majutsushi/tagbar'

" Shows all added, deleted and modified lines since the last commit via Vim its sign column.
" For more info: :h signify-options
Bundle 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight = '<leader>gh'
let g:signify_update_on_bufenter = 1
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0

" Visually displaying indent levels in Vim.
" The default mapping to toggle the plugin is <Leader>ig
Bundle 'nathanaelkane/vim-indent-guides'

" Provides syntax and indent plugins.
Bundle 'pangloss/vim-javascript'

" Vim Syntax File for SCSS (Sassy CSS)
Bundle 'cakebaker/scss-syntax.vim'

" color hex codes and color names
"Bundle 'chrisbra/color_highlight'
"let g:colorizer_auto_filetype='css,scss,scss.css,sass,html'
"let g:colorizer_auto_color = 0

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
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

" A Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

" Ruby on Rails power tools
Bundle 'tpope/vim-rails'

" Exploring the source code based on "tags", and it works like the context window of "Source Insight". 
" Open the Source Explorer window with :SrcExpl or :SrcExplToggle or map these commands to keys in your .vimrc.
Bundle 'wesleyche/SrcExpl'

" Vim plugin for intensely orgasmic commenting

" Most of the following mappings are for normal/visual mode only. The |NERDComInsertComment| mapping is for insert mode only.

" [count]<leader>cc |NERDComComment|
" Comment out the current line or text selected in visual mode.

" [count]<leader>cn |NERDComNestedComment|
" Same as <leader>cc but forces nesting.

" [count]<leader>c |NERDComToggleComment|
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

" [count]<leader>cm |NERDComMinimalComment|
" Comments the given lines using only one set of multipart delimiters.

" [count]<leader>ci |NERDComInvertComment|
" Toggles the comment state of the selected line(s) individually.

" [count]<leader>cs |NERDComSexyComment|
" Comments out the selected lines ``sexily''

" [count]<leader>cy |NERDComYankComment|
" Same as <leader>cc except that the commented line(s) are yanked first.

" <leader>c$ |NERDComEOLComment|
" Comments the current line from the cursor to the end of line.

" <leader>cA |NERDComAppendComment|
" Adds comment delimiters to the end of line and goes into insert mode between them.

" |NERDComInsertComment|
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.

" <leader>ca |NERDComAltDelim|
" Switches to the alternative set of delimiters.

" [count]<leader>cl
" [count]<leader>cb |NERDComAlignedComment|
" Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

" [count]<leader>cu |NERDComUncommentLine|
" Uncomments the selected line(s).

Bundle 'scrooloose/nerdcommenter'


" Ultimate auto-completion system
" Bundle 'Shougo/neocomplcache'

" A vim plugin for running your Ruby testsx:
" Bundle 'skalnik/vim-vroom'

" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}


"                                vim-color theme                               "
" ---------------------------------------------------------------------------- "

" It feels really nice especially for Ruby on Rails development
" rgb256 <=> Included in this repo.

" Precision colorscheme for the vim text editor
Bundle 'altercation/vim-colors-solarized'

" A port of the Railscasts Textmate theme to Vim
Bundle 'jpo/vim-railscasts-theme'

" Guardian is originally created for XHTML and CSS editing, however you can use it for Ruby and JavaScript development as well.
Bundle 'Suave/vim-colors-guardian'

" It’s perfect for JavaScript development.
Bundle 'Lokaltog/vim-distinguished'

" 256 colors version of github vim colorscheme
Bundle 'joedicastro/vim-github256'

"                               vim-scripts repos                              "
" ---------------------------------------------------------------------------- "

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

" Bring up the history of a given file. It will list the history in the
" window-pane on the left of the screen. If you hit enter it will diff that
" commit against the current revision loaded.
"
" In the log window __gitlog__ the following commands work:
" o      opens the file. This will simply open the file in a new window.
" s      starts a search and opens the search window.
" <cr>   This will open the file and diff it against the window that was active when it was lauched.
"
" In the search window __gitsearch__ the two following commands work:
" o      Opens the file. This will simply open the file in a new window.
" <cr>   This will open the file and diff it against the window that was active when it was lauched.
"
" In the Branch window:
" <cr>   This will change the log window to the branch selected. It does not change the current branch of the given repository.
Bundle 'git-log'


"                               Non github repo                                "
" ---------------------------------------------------------------------------- "

" Example
" Bundle 'git://git.wincent.com/command-t.git'


"                                 Brief help                                   "
" ---------------------------------------------------------------------------- "

" :BundleList          - List configured bundles
" :BundleInstall(!)    - Install(update) bundles
" :BundleSearch(!) foo - Search (or refresh cache first) for foo
" :BundleClean(!)      - Confirm (or auto-approve) removal of unused bundles
" :h vundle            - For more details (or see the wiki for FAQ)

" NOTE: Comments after Bundle command are not allowed.

filetype plugin indent on " Must be declared after Vundle stuff

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


" Quickly get out of insert mode
imap vv <Esc>
" Quickly get out of insert mode and write file
imap ww <Esc>:w<CR>
" Quickly write file in normal mode
nmap ^ <ESC>:w<CR>
let mapleader = ','     " Choose a nicer leader-key
" Use "ö"-key like ":"
map ö :
" Use "ä"-key like "/"
map ä /
" Press Ä to toggle highlighting on/off, and show current value.
map Ä :set hlsearch! hlsearch?<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

map <C-h> <C-w>h        " Easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>m4 <C-w>>   " Resize window
map <leader>m6 <C-w><
map <leader>m8 <C-w>-
map <leader>m2 <C-w>+

let i = 1               " More easy window navigation
while i <= 9
  execute 'map <Leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile

nmap <F8> :m .-2<CR>==          " Move lines of text or a whole block up or down
imap <F8> <Esc>:m .-2<CR>==gi   " TODO Better mapping
vmap <F8> :m '<-2<CR>gv=gv
imap <F7> <Esc>:m .+1<CR>==gi
nmap <F7> :m .+1<CR>==
vmap <F7> :m '>+1<CR>gv=gv

nmap <F5> :UndotreeToggle<cr>   " Shortcut to toggle Undotree on/off
nmap tt :ToggleWord<CR>

autocmd FileType ruby nmap <buffer> <F12> obinding.pry<Esc>:w<CR>   " Quick insertion and writing
autocmd FileType haml nmap <buffer> <F12> o- binding.pry<Esc>:w<CR> " Quick insertion and writing

" Convert HTML to Haml within a Vim Buffer using the html2haml command-line tool
" Installing is accomplished by: $ gem install html2haml
nmap <leader>2haml :%!html2haml --erb 2> /dev/null<CR>:set ft=haml<CR>
vmap <leader>2haml :!html2haml --erb 2> /dev/null<CR>


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


set termencoding=utf-8  " Encoding used for the terminal.
set encoding=utf-8      " Sets the character encoding used inside Vim.
set lazyredraw          " Don't update the display while executing macros
set laststatus=2        " Always put a status line in, even if there is only one window
set cmdheight=2         " Use a status bar that is 2 rows high
" Statusline stuff:
set statusline=%t\                                  " Filename
set statusline+=%{expand('%:p:h')}\                 " Path to file
set statusline+=%w%h%m%r                            " Options
set statusline+=%{fugitive#statusline()}            " Git Hotness
set statusline+=%=                                  " Right aligned:
" Filetype and encoding info:
set statusline+=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)
set statusline+=\ %l,%c/%L                            " Lines and cols
set statusline+=\ \(%{tabpagewinnr(tabpagenr())}\)  " Window number

"                            Colors and Colorschemes                           "
" ---------------------------------------------------------------------------- "

set t_Co=256                    " Use 256 colors in terminal
syntax enable                   " Syntax highlighting

" Use individual colorscheme depending on given fyletype:
"let g:colors_name = "nil"
"let last_colorscheme = g:colors_name
"au BufLeave * let last_colorscheme = g:colors_name
"augroup filetype_colorscheme
"" REFACT: Make a list/array containing the following filetypes:
  "au BufEnter * if &ft == "sass" || &ft == "scss.css" || &ft == "scss" || &ft == "css"
"\ |  if last_colorscheme != "distinguished"
"\ |    colorscheme distinguished
"\ |  endif
"\ |elseif &ft == "ruby"
"\ |  if last_colorscheme != "railscasts"
"\ |    colorscheme railscasts
"\ |  endif
"\ |elseif last_colorscheme != "solarized" && &ft != "nerdtree"
"\ |  syntax enable | set background=dark | colorscheme solarized
"\ |endif
"augroup END
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
set ttyfast                     " Always use a fast terminal
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


" Open a NERDTree when vim starts up without a file to open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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


set nocompatible  " be iMproved, required
filetype off      " Must be declared before Vundle stuff

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"                          Original repos on github                            "
" ---------------------------------------------------------------------------- "

" Let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'

" HTML5 omnicomplete and syntax
Plugin 'othree/html5.vim'

" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

" It handles syntax, indenting, compiling, and more. Also included is support for CoffeeScript in Haml and HTML.
Plugin 'kchmck/vim-coffee-script'

" Browsing the tags of source code files. It provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. This means that for example methods in C++ are displayed under the class they are defined in.
Plugin 'majutsushi/tagbar'

" Shows all added, deleted and modified lines since the last commit via Vim its sign column.
" For more info: :h signify-options
Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight = '<leader>gh'
let g:signify_update_on_bufenter = 1
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0

" Visually displaying indent levels in Vim.
" The default mapping to toggle the plugin is <Leader>ig
Plugin 'nathanaelkane/vim-indent-guides'

" Provides syntax and indent plugins.
Plugin 'pangloss/vim-javascript'

" Vim Syntax File for SCSS (Sassy CSS)
Plugin 'cakebaker/scss-syntax.vim'

" color hex codes and color names
"Plugin 'chrisbra/color_highlight'
"let g:colorizer_auto_filetype='css,scss,sass,html'
"let g:colorizer_auto_color = 1

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

" The NERD tree allows you to explore your filesystem and to open files and directories.
Plugin 'scrooloose/nerdtree'

" Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any resulting errors to the user
Plugin 'scrooloose/syntastic'

" Vim sugar for the UNIX shell commands that need it the most. Commands include:
" :Unlink: Delete a buffer and the file on disk simultaneously.
" :Remove: Like :Unlink, but doesn't require a neckbeard.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Chmod: Change the permissions of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :SudoWrite: Write a privileged file with sudo.
" :W: Write every open window. Handy for kicking off tools like guard.
Plugin 'tpope/vim-eunuch'

" A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" Ruby on Rails power tools
Plugin 'tpope/vim-rails'

" Vim runtime files for Haml, Sass, and SCSS
Plugin 'tpope/vim-haml'

" Exploring the source code based on "tags", and it works like the context window of "Source Insight".
" Open the Source Explorer window with :SrcExpl or :SrcExplToggle or map these commands to keys in your .vimrc.
Plugin 'wesleyche/SrcExpl'

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

Plugin 'scrooloose/nerdcommenter'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plugin 'klen/python-mode'
let g:pymode_folding = 0
let g:pymode_lint_hold = 0


" Powerline-fonts for the use with vim-airline
Plugin 'Lokaltog/powerline-fonts'

" lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" ri plugin for Vim
Plugin 'danchoi/ri.vim'

" greatly improves HTML & CSS workflow
" Plugin "mattn/emmet-vim"

" Ultimate auto-completion system
" Plugin 'Shougo/neocomplcache'

" A vim plugin for running your Ruby testsx:
" Plugin 'skalnik/vim-vroom'

" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"

Plugin 'Shougo/neocomplcache.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType haml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Easy note taking in Vim
Plugin 'xolox/vim-notes'
" Miscellaneous auto-load Vim scripts
" Needet for vim-notes
Plugin 'xolox/vim-misc'
let g:notes_directories = ['~/Dropbox/Vim-Notes']


Plugin 'thoughtbot/vim-rspec'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


"                                vim-color theme                               "
" ---------------------------------------------------------------------------- "

" It feels really nice especially for Ruby on Rails development
" rgb256 <=> Included in this repo.

" Precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized'
let g:solarized_termcolors = 256    " Tell solarized to use 256 colors in Terminal
let g:solarized_contrast = "normal"
let g:solarized_termtrans = 1
let g:solarized_hitrail   = 1


" A port of the Railscasts Textmate theme to Vim
Plugin 'jpo/vim-railscasts-theme'

" Guardian is originally created for XHTML and CSS editing, however you can use it for Ruby and JavaScript development as well.
Plugin 'Suave/vim-colors-guardian'

" It’s perfect for JavaScript development.
Plugin 'Lokaltog/vim-distinguished'

" 256 colors version of github vim colorscheme
Plugin 'joedicastro/vim-github256'

" vividchalk
Plugin 'tpope/vim-vividchalk'

" Zenburn
Plugin 'jnurmine/Zenburn'

" Gravity
Plugin 'gregsexton/Gravity'

"                               vim-scripts repos                              "
" ---------------------------------------------------------------------------- "

" Fast and Easy Find and Replace Across Multiple Files
" <Leader>vv  - Grep for the word under the cursor, match all occurences, like |gstar|
" <Leader>vV  - Grep for the word under the cursor, match whole word, like |star|
" <Leader>va  - Like vv, but add to existing list
" <Leader>vA  - Like vV, but add to existing list
" <Leader>vr  - Perform a global search search on the word under the cursor and prompt for a pattern with which to replace it.
" <Leader>vo  - Select the files to search in and set grep options
Plugin 'EasyGrep'

" Display your undo history in a graph
Plugin 'undotree.vim'

" The shortcut is gs You can google for the word under the cursor in normal mode,
" or you can search for selected text in visual mode.
Plugin 'voogle'

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
Plugin 'git-log'

" Manage Most Recently Used (MRU) files.
Plugin 'mru.vim'
let MRU_File = $HOME . '/.vim/.vim_mru_files'
map mru :MRU<CR>

" it can toggle words
Plugin 'toggle_words.vim'

" summerfruit256
Plugin 'summerfruit256.vim'

" AutumnLeaf
Plugin'AutumnLeaf'

" ironman.vim
Plugin 'ironman.vim'

" oceanlight
Plugin 'oceanlight'

" simpleandfriendly.vim
Plugin 'simpleandfriendly.vim'

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

" All of your Plugins must be added before the following lines
call vundle#end()
filetype plugin indent on


"                   These settings only works after Vundle                     "
" ---------------------------------------------------------------------------- "

colorscheme solarized

" Must be defined after the colorscheme ist initialized:

"highlight SignColumn ctermbg=black
"highlight LineNr     ctermbg=black
"highlight CursorLine ctermbg=black

"highlight SignifySignAdd    cterm=bold ctermbg=black  ctermfg=64
"highlight SignifySignDelete cterm=bold ctermbg=black  ctermfg=160
"highlight SignifySignChange cterm=bold ctermbg=black  ctermfg=166

set background=light
highlight SignColumn ctermbg=187
highlight SignifySignAdd    cterm=bold ctermbg=187  ctermfg=64
highlight SignifySignDelete cterm=bold ctermbg=187  ctermfg=160
highlight SignifySignChange cterm=bold ctermbg=187  ctermfg=166

"set background=dark
"highlight SignColumn ctermbg=235

call plug#begin('~/.vim/plugged')

" other plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'edkolev/tmuxline.vim'
Plug 'stephpy/vim-yaml'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

" Encoding
set encoding=utf-8

" Turn on highlighting for search
set hlsearch

" Turn on incremental search
set incsearch

" Turn on syntax highlighting
syntax on

" Yank to OS X clipboard
set clipboard=unnamed

" Turn on syntax highlighting
syntax on

" Turn on relative numbering
set nu
set rnu

" Make backspace work like normal
set backspace=indent,eol,start

" Highlight 80th character column
set colorcolumn=80

" Turn on mouse mode
set ttyfast
set mouse=a
set ttymouse=xterm2

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir


set tw=0
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set laststatus=2

" Enable invisible characters
set showbreak=↪\
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Enable wild menu for tab completion
set wildmode=longest,full
set wildmenu

" Colours
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
set t_Co=256
set t_ut=
set bg=dark
let g:rehash256 = 1
highlight Normal ctermbg=None ctermbg=None

" ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp

set rtp+=/usr/local/opt/fzf

" vim-airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme = 'base16_oceanicnext'

" Vim-markdown
let g:vim_markdown_folding_disabled=1

" Ale

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_typescript_tsserver_use_global = 1
let g:ale_javascript_eslint_use_global=0
let g:ale_linter_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

noremap <Leader>0 :ALEGoToDefinition<CR>
noremap <Leader>- :ALEFix<CR>
noremap <Leader>= :ALEFindReferences<CR>

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
au FileType gitcommit set tw=72 colorcolumn=50

" NERDTree
map - :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1

" FileType Conversions
au BufNewFile,BufRead *.md setfiletype markdown
au BufNewFile,BufRead *.hdbs setfiletype mustache

" Python
au BufNewFile,BufRead *.py
\set tabstop=4
\set softtabstop=4
\set shiftwidth=4
\set textwidth=79
\set expandtab
\set autoindent
\set fileformat=unix

" Set spellfile to location that is guaranteed to exist,
" can be symlinked to Dropbox or kept in Git
" and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" FZF
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'relative': v:true, 'yoffset':1.0 } }
nnoremap <c-p> :Files<CR>
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" SuperRetab
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Leader key mappings

" JSON prettify
nnoremap <leader>jp :%!python -m json.tool<CR>

" Toggle invisible characters
nnoremap <leader>ic :set list!<CR>

" Useful mappings for surrounding words
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
:nnoremap <leader>` viw<esc>a`<esc>hbi`<esc>lel

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<CR>
noremap <leader>to :tabonly<CR>
noremap <leader>tc :tabclose<CR>
noremap <leader>tm :tabmove

" Clear search higlighting
nnoremap <leader><space> :nohlsearch<CR>
"
" Redraw syntax higlighting
nnoremap <leader>sh :sy sync fromstart<CR>

" Remove trailing whitespace
nnoremap <leader>S :%s/\s\+$//<CR>:let @/=''<CR>

" Convenience shortcuts for vim session management
nnoremap <leader>ms :mksession ./Session.vim<CR>
nnoremap <leader>rs :!rm -f ./Session.vim<CR>

" Convenience shortcuts for vim-plug
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>ps :PlugStatus<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pg :PlugUpgrade<CR>

" Convenience shortcuts for Fugitive
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>ga :Git commit --amend<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>

" Convenience shortcuts for vim-gitgutter
nnoremap <leader>hd ::GitGutterLineHighlightsToggle<CR>

" Convenience shortcuts for Tab2Space & Space2Tab
nnoremap <leader>t2s :Tab2Space<CR>
vnoremap <leader>t2s :Tab2Space<CR>
nnoremap <leader>s2t :Space2Tab<CR>
vnoremap <leader>s2t :Space2Tab<CR>

" Convenience shortcuts for vimrc & tmux.conf
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>et :vsp ~/.tmux.conf<CR>

" Just write and exit already!
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

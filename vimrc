call plug#begin('~/.vim/plugged')

" other plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'git@github.com:zopim/vim-jxml'
Plug 'chriskempson/base16-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'rust-lang/rust.vim'
Plug 'gregsexton/gitv', {'on': ['Gitv']}

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

" Make backspace work like normal
set backspace=indent,eol,start

" Highlight 80th character column
set colorcolumn=80

" Turn on mouse mode
set ttyfast
set mouse=a
set ttymouse=xterm2

set guifont=Hack:h12

set tw=0
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set autochdir
set laststatus=2

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
" colorscheme base16-oceanicnext
let g:rehash256 = 1
highlight Normal ctermbg=None ctermbg=None

" Ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|bin$',
  \ 'file': '\v\.(exe|so|dll|swo|swp)$'
  \ }

" ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp

" vim-airline
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme = 'base16_oceanicnext'

" Vim-markdown
let g:vim_markdown_folding_disabled=1

map - :vsp .<CR>

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
au FileType gitcommit set tw=72 colorcolumn=50

" FileType Conversions
au BufNewFile,BufRead *.md setfiletype markdown

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
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
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

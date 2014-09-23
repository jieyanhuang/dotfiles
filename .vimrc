set encoding=utf-8
set hlsearch
set tabstop=2
set shiftwidth=2
set mouse-=a
set cursorline
set autoindent
set autochdir
set nu
syntax on
filetype plugin indent on
set laststatus=2

" Map F3 and F4 to quick switch between vim buffers
noremap <F3> :bprev<CR>
noremap <F4> :bnext<CR>

" Relative numbers
au FocusLost * :set number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Show invisible chars and trailing spaces
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

" Clear search higlighting
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" Filetypes
au BufRead,BufNewFile *.jcss setfiletype javascript
au BufRead,BufNewFile *.jxml setfiletype html

" Colours
set t_Co=256
set t_ut=
set bg=dark
let g:molokai_original = 1
let g:rehash256=1
colorscheme molokai

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_theme = 'powerlineish'

" Pathogen
execute pathogen#infect()
call pathogen#helptags() "generate helptags for everything in 'runtimepath'

" Ctrl-P
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" NERDTree
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" Taglist
filetype plugin on

" FileType Conversions
au BufRead,BufNewFile *.jxml setfiletype html
au BufNewFile,BufRead *.md setfiletype markdown

" SuperRetab
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
" Convenience shortcuts for this
nnoremap <leader>t :Tab2Space<CR>
nnoremap <leader>s :Space2Tab<CR>

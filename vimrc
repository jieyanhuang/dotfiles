" Pathogen
execute pathogen#infect()
call pathogen#helptags() "generate helptags for everything in 'runtimepath'

set encoding=utf-8
set hlsearch
set cursorline
set nu
set tabstop=2
set shiftwidth=2
set mouse-=a
syntax on
set autoindent
set autochdir
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

" Colours
set t_CO=256
set t_ut=
set bg=dark
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_theme = 'wombat'

" Vim-markdown
let g:vim_markdown_folding_disabled=1

" NERDTree
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map <F2> :NERDTreeToggle<CR>

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" FileType Conversions
au BufNewFile,BufRead *.md setfiletype markdown

" SuperRetab
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
" Convenience shortcuts for this
nnoremap <leader>t :Tab2Space<CR>
nnoremap <leader>s :Space2Tab<CR>

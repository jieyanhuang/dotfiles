set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" other plugins
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'zopim/vim-jxml'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/goyo.vim'
Plugin 'ryanss/vim-hackernews'

call vundle#end()

filetype plugin indent on
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

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Clear search higlighting
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Colours
set t_CO=256
set t_ut=
let g:molokai_original = 1
colorscheme molokai
let g:rehash256 = 1

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_theme = 'wombat'

" promptline
let g:promptline_preset = 'full'

" Vim-markdown
let g:vim_markdown_folding_disabled=1

" NERDTree
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map <F2> :NERDTreeToggle<CR>

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <leader>p :diffput<CR>
nnoremap <leader>g :diffget<CR>

" FileType Conversions
au BufNewFile,BufRead *.md setfiletype markdown

" SuperRetab
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
" Convenience shortcuts for this
nnoremap <leader>t :Tab2Space<CR>
nnoremap <leader>s :Space2Tab<CR>

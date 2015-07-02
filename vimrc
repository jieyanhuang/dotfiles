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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tomtom/tcomment_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'zopim/vim-jxml'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
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
set smartindent
set autochdir
set laststatus=2

" Make j and k move up and down better for wrapped lines
:noremap k gk
:noremap j gj
:noremap gk k
:noremap gj j

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
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme = 'wombat'

" promptline
let g:promptline_preset = 'full'

" Goyo
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.8

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Goyo
function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Goyo 150
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Vim-markdown
let g:vim_markdown_folding_disabled=1

" NERDTree
let g:NERDTreeDirArrows=0
let g:NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
map <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
au FileType gitcommit set tw=72

" FileType Conversions
au BufNewFile,BufRead *.md setfiletype markdown

" SuperRetab
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Leader key mappings

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<CR>
noremap <leader>to :tabonly<CR>
noremap <leader>tc :tabclose<CR>
noremap <leader>tm :tabmove

" Goyo
nnoremap <leader>me :Goyo<CR>
nnoremap <leader>mc :Goyo<CR>

" Clear search higlighting
nnoremap <leader><space> :nohlsearch<CR>

" Remove trailing whitespace
nnoremap <leader>S :%s/\s\+$//<CR>:let @/=''<CR>

" Convenience shortcuts for Vundle
nnoremap <leader>pc :PluginClean<CR>
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pl :PluginList<CR>
nnoremap <leader>pu :PluginUpdate<CR>

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

" Convenience shortcuts for Tab2Space & Space2Tab
nnoremap <leader>t2s :Tab2Space<CR>
vnoremap <leader>t2s :Tab2Space<CR>
nnoremap <leader>s2t :Space2Tab<CR>
vnoremap <leader>s2t :Space2Tab<CR>

" Convenience shortcuts for vimrc
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" ================================================
" VIM-PLUG
" ================================================
" download plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" initialize plugin system
call plug#begin('~/.vim/plugged')

" color scheme. https://github.com/axiaoxin/favorite-vim-colorscheme
Plug 'axiaoxin/favorite-vim-colorscheme'

" fancy start screen for vim. https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" better rainbow parentheses. https://github.com/kien/rainbow_parentheses.vim
Plug 'kien/rainbow_parentheses.vim'

" lean & mean status/tabline for vim that's light as air. https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" a tree explorer plugin for vim. https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" vim plugin for intensely orgasimc commenting. https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" a code-completion engine for vim. (need macvim)

call plug#end()

" ================================================
" BASE CONFIG
" ================================================
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936  " set encoding as utf-8
set nobackup                                          " cancel backup
set noswapfile                                        " cancel swap file
set noundofile                                        " cancel undo file
set laststatus=2                                      " status bar
syntax enable                                         " enable syntax highlighting
syntax on                                             " syntax highlighting
set number                                            " display line numbers
set autoindent                                        " always set autoindenting on
set smartindent                                       " use smart indent if there is no indent file
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set mouse=a
set guifont=Menlo:h14
colorscheme Tomorrow-Night-Bright                     " set colorscheme

" ================================================
" KEY MAPPING
" ================================================
nmap <silent> <F3> :NERDTreeToggle<CR>


" ================================================
" PLUGIN CONFIG
" ================================================
" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3' ],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#entensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_set = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" NerdCommenter
let g:NERDSpaceDelims = 1

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
" autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


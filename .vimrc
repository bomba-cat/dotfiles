" --Plugins

call plug#begin()

" --NerdTree Stuff
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

" --IDE Stuff
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'dyng/ctrlsf.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'

" --Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'michaeldyrynda/carbon'

call plug#end()

" --Config

set nu
set cursorline
silent! TroublesomeCommand

" --AutoStart

autocmd VimEnter * NERDTree | wincmd p

" --Colorscheme

colorscheme red_theme

" --Variables

let g:NERDTreeWinPos = "right"

" --Keybinds

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <F2> <C-w>n:edit 
nmap <C-x> :bdelete<CR>
nmap <TAB> :bnext<CR>
nmap <C-s> :w<CR>
nmap <C-t> :terminal<CR>
nmap <C-c> :! 
nmap <C-Up> <C-w>j<C-w>+<C-w>k
nmap <C-Down> <C-w>k<C-w>+<C-w>j
nmap <C-Left> <C-w>h<C-w><<C-w>l
nmap <C-Right> <C-w>l<C-w><<C-w>h

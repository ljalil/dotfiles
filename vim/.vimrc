"Abdeljalil Letrache
"<abdeljalilletrache@outlook.com>
"
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

set number
colorscheme nord
set hlsearch	"Highlight search
set incsearch	"Highlight partial search
set linebreak	"Don't break words when line are too long

set wildignore=*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.glg,*.glo,*.lot,*.out,*.synctex.gz,*.toc
set encoding=UTF-8

au BufRead,BufNewFile *.todo set filetype=todo

let g:vimtex_fold_enabled = 1
"IPython cells highlight

"let NERDTreeIgnore = ['\.acn$','\.acr$','\.alg$','\.aux$','\.bbl$','\.blg$','\.glg$', '\.glo$', '\.lot$', '\.out$', '\.synctex\.gz$', '\.toc$']
let NERDTreeIgnore = ['\.acn$[[file]]','\.acr$[[file]]','\.alg$[[file]]','\.aux$[[file]]','\.bbl$[[file]]','\.blg$[[file]]','\.glg$[[file]]', '\.glo$[[file]]', '\.lot$[[file]]', '\.out$[[file]]', '\.synctex\.gz$[[file]]', '\.toc$[[file]]','\.fls$[[file]]','\.gls$[[file]]','\.ist$[[file]]','\.lof$[[file]]','\.log$[[file]]','\.fdb_latexmk$[[file]]','\.synctex(busy)$[[file]]']

"==========================================
" vim-plug settings
"==========================================

call plug#begin('~/.vim/plugged')
"------------------=== Code/Project Navigation ===------------------
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar' "requires exuberant-ctags package to be installed
Plug 'sheerun/vim-polyglot'
"------------------=== Powerline  ===------------------
"install via: pip3 install powerline-status
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2

"------------------=== Lightline  ===------------------
"Plug 'itchyny/lightline.vim'
"set laststatus=2
"set noshowmode

"------------------=== Airline  ===------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='nord'
"------------------=== Languages Support ===------------------
Plug 'lervag/vimtex'
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_toc_config = {
			\'split_pos'   : ':vert :botright',
			\'split_width':  35,
			\'layers' : ['content'],
			\'fold_enable' : 1,
			\'show_help' : 0,
			\}
let g:vimtex_fold_types = {
			\'comments' : {'enabled' : 1},
			\'envs' : {
			\'blacklist' : [],
			\'whitelist' : ['figure', 'table'],
			\},
			\}
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
set encoding=utf-8
"------------------=== Snippets ===------------------
Plug 'sirver/ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"

"------------------=== REPL ===------------------
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell'
"Plug 'jupyter-vim/jupyter-vim'
let g:slime_target = "x11"
let g:slime_paste_file = "$HOME/.slime_paste"

"------------------=== fzf  ===------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"------------------=== Appearance ===------------------
Plug 'arcticicestudio/nord-vim'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

"------------------=== Writing ===------------------
Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 8 "DarkGray

call plug#end()

"==========================================
" Key mapping
"==========================================
let mapleader = " "
let maplocalleader = ","

nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>c :IPythonCellExecuteCell<CR>

filetype plugin on

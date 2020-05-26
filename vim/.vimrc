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
colo base16-nord
set hlsearch
set incsearch
set wildignore=*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.glg,*.glo,*.lot,*.out,*.synctex.gz,*.toc
"IPython cells highlight

"let NERDTreeIgnore = ['\.acn$','\.acr$','\.alg$','\.aux$','\.bbl$','\.blg$','\.glg$', '\.glo$', '\.lot$', '\.out$', '\.synctex\.gz$', '\.toc$']
let NERDTreeIgnore = ['\.acn$[[file]]','\.acr$[[file]]','\.alg$[[file]]','\.aux$[[file]]','\.bbl$[[file]]','\.blg$[[file]]','\.glg$[[file]]', '\.glo$[[file]]', '\.lot$[[file]]', '\.out$[[file]]', '\.synctex\.gz$[[file]]', '\.toc$[[file]]','\.fls$[[file]]','\.gls$[[file]]','\.ist$[[file]]','\.lof$[[file]]','\.log$[[file]]','\.fdb_latexmk$[[file]]','\.synctex(busy)$[[file]]']

"==========================================
" vim-plug settings
"==========================================

call plug#begin('~/.vim/plugged')
"------------------=== Code/Project Navigation ===------------------
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
"------------------=== Powerline  ===------------------
"install via: pip3 install powerline-status
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

"------------------=== Languages Support ===------------------
Plug 'lervag/vimtex'
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'zathura'

"------------------=== Snippets ===------------------
Plug 'sirver/ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"

"------------------=== REPL ===------------------
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell'
"Plug 'jupyter-vim/jupyter-vim'
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

"------------------=== fzf  ===------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"------------------=== Colorschemes ===------------------
Plug 'flazz/vim-colorschemes'

call plug#end()

"==========================================
" Key mapping
"==========================================
let mapleader = " "
nnoremap <leader>l :wall<cr>:VimtexCompile<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>c :IPythonCellExecuteCell<CR>

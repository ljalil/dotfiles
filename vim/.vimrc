" Abdeljalil Letrache
" abdeljalilletrache@outlook.com
" github.com/ljalil

" *************************************** "
"	       _                   	  "
"	__   _(_)_ __ ___  _ __ ___ 	  "
"	\ \ / / | '_ ` _ \| '__/ __|	  "
"	 \ V /| | | | | | | | | (__ 	  "
"	  \_/ |_|_| |_| |_|_|  \___|	  "
"	                            	  "
" *************************************** "

"┌─────────┐
"│ Vimplug │
"└─────────┘
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar' "requires exuberant-ctags package to be installed
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'sirver/ultisnips'
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
call plug#end()
"┌──────────────────┐
"│ General settings │
"└──────────────────┘
set encoding=utf-8
set relativenumber
set hidden
filetype plugin on
let mapleader = " "
let maplocalleader = ","
set nuw=4			"Extend numbers left margin
set hlsearch			"Highlight search
set incsearch			"Highlight partial search
set linebreak			"Don't break words when line are too long
set wildignore=*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.glg,*.glo,*.lot,*.out,*.synctex.gz,*.toc
colo ayu
set termguicolors
hi VertSplit ctermbg=236
set fillchars+=vert:\ 
hi NonText ctermfg=None

"┌─────────┐
"│ Airline │
"└─────────┘
set laststatus=2
set noshowmode			"Don't show mode, it's already in airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''		" -|
let g:airline_right_sep = ''		"  |_ Remove rectangular seperators
let g:airline_left_alt_sep = ''		"  |
let g:airline_right_alt_sep = ''	" -|
let g:airline#extensions#whitespace#enabled = 0 "Don't show white spaces info
let g:airline_theme='ayu'

"┌──────────┐
"│ NERDTree │
"└──────────┘
nnoremap <leader>t :NERDTreeToggle<cr>
highlight! link NERDTreeFlags NERDTreeDir "Apply highliting to folders icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""
let g:NERDTreeMinimalUI = v:true

"┌───────────┐
"│ UltiSnips │
"└───────────┘
let g:UltiSnipsSnippetDirectories	=	[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger		=	"<Tab>"
let g:UltiSnipsJumpForwardTrigger	=	"<Tab>"
let g:UltiSnipsJumpBackwardTrigger	=	"<S-Tab>"

"┌────────┐
"│ Vimtex │
"└────────┘
let g:tex_flavor = "latex"
let g:vimtex_view_method = "zathura"
let g:vimtex_view_general_viewer = 'vimtex_viewer_zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_toc_config = {
			\'split_pos'   : ':vert :botright',
			\'split_width':  35,
			\'layers' : ['content'],
			\'fold_enable' : 1,
			\'show_help' : 0,
			\}
let g:vimtex_fold_enabled = 0
let g:vimtex_fold_types = {
			\'comments' : {'enabled' : 1},
			\'envs' : {
			\'blacklist' : [],
			\'whitelist' : ['figure', 'table'],
			\},
			\}
set nofoldenable		"Disable folding when opening a file
"┌─────────────┐
"│ Tex-Conceal │
"└─────────────┘
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

"┌───────────┐
"│ Vim Slime │
"└───────────┘
let g:slime_target = "kitty"
let g:slime_paste_file = "$HOME/.slime_paste"

"┌──────────────┐
"│ IPython Cell │
"└──────────────┘
nnoremap <leader>c		:IPythonCellExecuteCell<CR>
nnoremap <leader>cc		:IPythonCellExecuteCellJump<CR>
nnoremap <leader><Up>		:IPythonCellPrevCell<CR>
nnoremap <leader><Down>		:IPythonCellNextCell<CR>

"┌────────┐
"│ Tagbar │
"└────────┘
nnoremap <leader>b :TagbarToggle<cr>

"┌─────┐
"│ FZF │
"└─────┘
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

"┌───────────┐
"│ Limelight │
"└───────────┘
let g:limelight_conceal_ctermfg = 8 "DarkGray
"fix conceal color for Nord color scheme
:hi Conceal ctermfg=109 guifg=#8fbcbb ctermbg=NONE guibg=NONE
"┌───────────┐
"│ Powerline │
"└───────────┘
"install via: pip3 install powerline-status
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2

"function! SynctexForward()
"python3 << EOF
"import os
"(row, col) = vim.current.window.cursor
"path_input = str(vim.current.buffer.name)
"path_output = path_input.replace('.tex', '.pdf')
"command = 'zathura --synctex-forward {}:{}:{} {}'.format(row, col, path_input, path_output)
"os.system(command)
"EOF
"endfunction
"nnoremap <localleader>lf :call SynctexForward()<cr>

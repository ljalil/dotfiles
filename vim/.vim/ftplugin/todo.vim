"syntax match todoCheckbox "\[\ \]" conceal cchar=
"syntax match todoCheckbox "\[x\]" conceal cchar=
"hi Conceal ctermbg=NONE
syntax match todoNotCompleted "\[\ \].*"
syntax match todoHalfCompleted "\[\-\].*"
syntax match todoCompleted "\[x\].*"

highlight todoNotCompleted ctermfg=Red
highlight todoHalfCompleted ctermfg=Yellow
highlight todoCompleted cterm=strikethrough ctermfg=Green

nnoremap <localleader>tc :s/\[\ \]/\[x\]/<cr>:nohl<cr>
nnoremap <localleader>tn :s/\[.\]/\[ \]/<cr>:nohl<cr>

function! TodoMarkDone()
python3 << EOF
vim.current.line = vim.current.line.replace('[ ]', '[x]')
vim.current.line = vim.current.line.replace('[-]', '[x]')
EOF
endfunction

function! TodoMarkProgress()
python3 << EOF
vim.current.line = vim.current.line.replace('[ ]', '[-]')
vim.current.line = vim.current.line.replace('[x]', '[-]')
EOF
endfunction

function! TodoMarkNew()
python3 << EOF
vim.current.line = vim.current.line.replace('[-]', '[ ]')
vim.current.line = vim.current.line.replace('[x]', '[ ]')
EOF
endfunction

function! ResetCursor()
python3 << EOF
vim.current.window.cursor = (1,5)
EOF
endfunction

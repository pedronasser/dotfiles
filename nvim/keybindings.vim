" Hotkey to open the file explorer
noremap <C-B> <ESC>:NvimTreeToggle<cr>
noremap <C-O> :NvimTreeFocus<cr>
inoremap <C-b> <ESC>:NvimTreeToggle<cr> 
" noremap <C-L> :call setqflist([])<cr>

" Move to previous/next
" noremap <silent>    <Space> :BufferPrevious<CR>
noremap <silent>    <Space><Tab> :BufferNext<CR>
" Re-order to previous/next
noremap <silent>    <C-A-Left> :BufferMovePrevious<CR>
noremap <silent>    <C-A-Right> :BufferMoveNext<CR>
" Goto buffer in position...
noremap <silent>    <Space>1 :BufferGoto 1<CR>
noremap <silent>    <Space>2 :BufferGoto 2<CR>
noremap <silent>    <Space>3 :BufferGoto 3<CR>
noremap <silent>    <Space>4 :BufferGoto 4<CR>
noremap <silent>    <Space>5 :BufferGoto 5<CR>
noremap <silent>    <Space>6 :BufferGoto 6<CR>
noremap <silent>    <Space>7 :BufferGoto 7<CR>
noremap <silent>    <Space>8 :BufferGoto 8<CR>
noremap <silent>    <Space>9 :BufferGoto 9<CR>
noremap <silent>    <Space>10 :BufferLast<CR>

" Close buffer
noremap <silent>    <Space>w :BufferClose<CR>

" Telescope keybindings
noremap <silent>   <C-S-p> <cmd>Telescope command_palette<cr>
noremap <silent>   <D-p> <cmd>Telescope find_files<cr>
noremap <silent>   <C-p> <cmd>Telescope find_files<cr>
noremap <silent>   <C-S-s> <cmd>Telescope lsp_document_symbols<cr>
noremap <silent>   / <cmd>Telescope current_buffer_fuzzy_find<cr>
noremap <silent>   <C-S-f> <cmd>Telescope live_grep<cr>
noremap <silent>   <C-S-d> <cmd>Telescope diagnostics<cr>
noremap <silent>   <D-S-f> <cmd>Telescope live_grep<cr>
noremap <silent>   <D-S-d> <cmd>Telescope diagnostics<cr>
noremap <silent>   <A-Space> <cmd>Telescope buffers<cr>

" Select current line
map <silent>   <C-l> <ESC>V

" Reload vim configuration
noremap <silent>   <C-A-r> <cmd>source $MYVIMRC<cr>


"noremap <Tab> <C-w>w
"noremap <C-S-v> <C-w>j
"noremap <C-S-h> <C-w>q

" Keybindings to move lines
" 
noremap <C-S-Up>     :m-2<CR>gv=gv
noremap <C-S-Down>   :m'>+<CR>gv=gv
noremap <D-S-Up>     :m-2<CR>gv=gv
noremap <D-S-Down>   :m'>+<CR>gv=gv


" move current line up one line
noremap <C-S-Up>  :<C-u>m-2<CR>==
noremap <D-S-Up>  :<C-u>m-2<CR>==

" move current line down one line
noremap <C-S-Down> :<C-u>m+<CR>==
noremap <D-S-Down> :<C-u>m+<CR>==


" Text selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>

vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>

imap <S-Up> <ESC>v<Up>
imap <S-Down> <ESC>v<Down>
imap <S-Left> <ESC>v<Left>
imap <S-Right> <ESC>v<Right>

" Make Home and End keys work
noremap <ESC>[8~    <End>
noremap <ESC>[7~    <Home>
"noremap <D-Right>    <End>
"noremap <D-Left>    <Home>
"imap <ESC>[8~    <End>  
"imap <ESC>[7~    <Home>

" Delete on normal end visual mode
vnoremap <bs> "_d
nnoremap <bs> "_d

map <C-a> <esc>ggVG<CR>
map <D-a> <esc>ggVG<CR>

" Duplicate the current line
noremap <A-d> <ESC>Yp
noremap <A-d> <ESC>Yp

" Delete current line
noremap <C-Delete> <ESC>dd
noremap <D-Delete> <ESC>dd
nnoremap <Delete> xi

" Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+


nnoremap <Tab> 0V$>
nnoremap <S-Tab> 0V$<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


" CTRL+S to Save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"remap <silent>   <C-f> <cmd>silent! Neoformat<cr>
noremap <silent> <C-f> :lua vim.lsp.buf.format({ async = true })<CR>


" Close vim
noremap <C-Q>          :exit<CR>
vnoremap <C-Q>         <C-C>:exit<CR>
inoremap <C-Q>         <C-O>:exit<CR>


" Undo/redo keybindings
" nnoremap <C-S-Z> <C-R>
" nnoremap <C-Y> <C-R>
noremap <C-Z> <ESC>u
noremap <C-S-Z> <ESC><C-R>
" inoremap <C-Z> <C-O>u
" inoremap <C-S-Z> <C-O><C-R>
" inoremap <C-Y> <C-O><C-R>

map <C-G> <ESC>:
map <D-G> <ESC>:

"Toggle comments
"nmap <C-K>   <Plug>NERDCommenterToggle
"vmap <C-K>   <Plug>NERDCommenterToggle<CR>gv
"imap <C-K>   <Esc><Plug>NERDCommenterToggle<CR>i

map <C-A-J> <cmd>TroubleToggle<cr>
map <D-A-J> <cmd>TroubleToggle<cr>

nnoremap <Backspace> i<Backspace>
noremap <silent> <C-Backspace> <cmd>let @/ = ""<cr>i

inoremap <ESC>f <S-Right>
nnoremap <ESC>f i<S-Right>

imap <C-Right> <Esc>$a
imap <C-Left> <Esc>0

map q <Nop>

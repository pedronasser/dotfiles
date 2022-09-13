" Hotkey to open the file explorer
noremap <C-B> <ESC>:NvimTreeToggle<cr>
noremap <C-O> :NvimTreeFocus<cr>
inoremap <C-b> <ESC>:NvimTreeToggle<cr> 
" noremap <C-L> :call setqflist([])<cr>
"
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

noremap <silent>    <Space>w :BufferClose<CR>





" Telescope keybindings
noremap <silent>   <C-S-p> <cmd>Telescope command_palette<cr>
noremap <silent>   <C-p> <cmd>Telescope find_files<cr>
noremap <silent>   <C-S-s> <cmd>Telescope lsp_document_symbols<cr>
noremap <silent>   / <cmd>Telescope current_buffer_fuzzy_find<cr>
noremap <silent>   <C-S-f> <cmd>Telescope live_grep<cr>
noremap <silent>   <C-S-d> <cmd>Telescope diagnostics<cr>
noremap <silent>   <A-Space> <cmd>Telescope buffers<cr>

" Select current line
nnoremap <silent> <C-l> 0vg_V
vnoremap <silent> <C-l> og0og_V
inoremap <silent> <C-l> <ESC>0vg_V


" Reload vim configuration
noremap <silent>   <C-A-r> <cmd>source $MYVIMRC<cr>


"noremap <Tab> <C-w>w
"noremap <C-S-v> <C-w>j
"noremap <C-S-h> <C-w>q

" Keybindings to move lines
" Bubble single lines
nnoremap <C-S-Up> ddkP
nnoremap <C-S-Down> ddp
" Bubble multiple lines
vnoremap <C-S-Up> xkP`[V`]
vnoremap <C-S-Down> xp`[V`]

" noremap <C-S-Up>     :m-2<CR>gv=gv
" noremap <C-S-Down>   :m'>+<CR>gv=gv"
"
" noremap <C-S-Up>  :<C-u>m-2<CR>==


" move current line down one line
noremap <C-S-Down> :<C-u>m+<CR>==

xnoremap <S-Up> <Up>
xnoremap <S-Down> <Down>
xnoremap <S-Left> <Left>
xnoremap <S-Right> <Right>

noremap <S-Up> v<Up>
noremap <S-Down> v<Down>
noremap <S-Left> v<Left>
noremap <S-Right> v<Right>

vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>

inoremap <S-Up> <ESC>v<Up>
inoremap <S-Down> <ESC>v<Down>
inoremap <S-Left> <ESC>v<Left>
inoremap <S-Right> <ESC>v<Right>

" Make Home and End keys work
noremap <ESC>[8~    <End>
noremap <ESC>[7~    <Home>
inoremap <ESC>[8~    <End>
inoremap <ESC>[7~    <Home>
"imap <ESC>[8~    <End>  
"imap <ESC>[7~    <Home>

" Delete on normal end visual mode
vnoremap <bs> "_d
nnoremap <bs> "_d

map <C-a> <esc>ggVG<CR>

" Duplicate the current line
noremap <C-d> <ESC>Yp
noremap <C-d> <ESC>Yp

" Delete current line
noremap <C-Delete> <ESC>dd
nnoremap <Delete> xi

" Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
vmap <C-X> "0c

vmap <C-v> x"0gPi<right>
imap <C-v> <C-R>0

xnoremap <A-c> "0ygv"*y<ESC>
vnoremap <A-c> "0ygv"*y<ESC>
inoremap <A-c> <ESC>0vg_"0ygv"*y<ESC>
  
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
noremap <silent> <Space>f :lua vim.lsp.buf.format({ async = true })<CR>

" Close vim
noremap <C-Q>          :exit<CR>
vnoremap <C-Q>         <C-C>:exit<CR>
inoremap <C-Q>         <C-O>:exit<CR>


" Undo/redo keybindings
" nnoremap <C-S-Z> <C-R>
" nnoremap <C-Y> <C-R>
noremap <C-z> <ESC>u
noremap <C-y> <ESC><C-R>
inoremap <C-z> <ESC>ui
inoremap <C-y> <ESC><C-R>i

" inoremap <C-Z> <C-O>u
" inoremap <C-S-Z> <C-O><C-R>
" inoremap <C-Y> <C-O><C-R>

map <C-G> <ESC>:

"Toggle comments
"nmap <C-K>   <Plug>NERDCommenterToggle
"vmap <C-K>   <Plug>NERDCommenterToggle<CR>gv
"imap <C-K>   <Esc><Plug>NERDCommenterToggle<CR>i

map <C-A-J> <cmd>TroubleToggle<cr>

nnoremap <Backspace> i<Backspace>

inoremap <ESC>f <S-Right>
nnoremap <ESC>f i<S-Right>

imap <C-Right> <Esc>$a
imap <C-Left> <Esc>0



map q <Nop>

map <silent> <C-b> :NvimTreeToggle<cr>



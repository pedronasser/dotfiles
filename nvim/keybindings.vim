" Hotkey to open the file explorer
noremap <C-B> :NvimTreeToggle<cr>
noremap <C-O> :NvimTreeFocus<cr>
noremap <C-L> :call setqflist([])<cr>

" Move to previous/next
noremap <silent>    <A-Left> :BufferPrevious<CR>
noremap <silent>    <A-Right> :BufferNext<CR>
" Re-order to previous/next
noremap <silent>    <C-A-Left> :BufferMovePrevious<CR>
noremap <silent>    <C-A-Right> :BufferMoveNext<CR>
" Goto buffer in position...
noremap <silent>    <A-1> :BufferGoto 1<CR>
noremap <silent>    <A-2> :BufferGoto 2<CR>
noremap <silent>    <A-3> :BufferGoto 3<CR>
noremap <silent>    <A-4> :BufferGoto 4<CR>
noremap <silent>    <A-5> :BufferGoto 5<CR>
noremap <silent>    <A-6> :BufferGoto 6<CR>
noremap <silent>    <A-7> :BufferGoto 7<CR>
noremap <silent>    <A-8> :BufferGoto 8<CR>
noremap <silent>    <A-9> :BufferGoto 9<CR>
noremap <silent>    <A-0> :BufferLast<CR>

" Close buffer
noremap <silent>    <A-w> :BufferClose<CR>

" Telescope keybindings
noremap <silent>   <C-S-p> <cmd>Telescope command_palette<cr>
noremap <silent>   <D-p> <cmd>Telescope find_files<cr>
noremap <silent>   <C-p> <cmd>Telescope find_files<cr>
noremap <silent>   <C-S-s> <cmd>Telescope lsp_document_symbols<cr>
noremap <silent>   <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
noremap <silent>   <D-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
noremap <silent>   / <cmd>Telescope current_buffer_fuzzy_find<cr>
noremap <silent>   <C-S-f> <cmd>Telescope live_grep<cr>
noremap <silent>   <C-S-d> <cmd>Telescope diagnostics<cr>
noremap <silent>   <D-S-f> <cmd>Telescope live_grep<cr>
noremap <silent>   <D-S-d> <cmd>Telescope diagnostics<cr>
noremap <silent>   <A-Space> <cmd>Telescope buffers<cr>

" Select current line
noremap <silent>   <C-l> <ESC>V
noremap <silent>   <D-l> <ESC>V

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

" Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

vmap <Tab> >gv
vmap <S-Tab> <gv

<
nnoremap <silent> <Space> <cmd>lua vim.lsp.buf.hover()<CR>

" LSP related keybindings
nnoremap <silent> <C-Enter>    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <D-Enter>    <cmd>lua vim.lsp.buf.code_action()<CR>

" LSP goto actions

nnoremap <silent> gi   <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gd   <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr   <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> ge   <cmd>lua vim.diagnostic.goto_next()<CR>

nnoremap <silent> rr vim.lsp.buf.rename

" CTRL+S to Save
noremap <C-S>          :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-O>:update<CR>

" Close vim
noremap <C-Q>          :q<CR>
vnoremap <C-Q>         <C-C>:q<CR>
inoremap <C-Q>         <C-O>:q<CR>

" Undo/redo keybindings
nnoremap <C-Z> u
nnoremap <C-S-Z> <C-R>
nnoremap <C-Y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-S-Z> <C-O><C-R>
inoremap <C-Y> <C-O><C-R>

map <C-G> <ESC>:
map <D-G> <ESC>:

"Toggle comments
nmap <C-K>   <Plug>NERDCommenterToggle
vmap <C-K>   <Plug>NERDCommenterToggle<CR>gv
imap <C-K>   <Esc><Plug>NERDCommenterToggle<CR>i

map <C-A-J> <cmd>TroubleToggle<cr>
map <D-A-J> <cmd>TroubleToggle<cr>

nnoremap <Backspace> i<Backspace>
noremap <silent> <C-Backspace> <cmd>let @/ = ""<cr>i

inoremap <ESC>f <S-Right>
nnoremap <ESC>f i<S-Right>

imap <C-Right> <Esc>$a
imap <C-Left> <Esc>0

" Nops
noremap <Tab> <Nop>
" Hotkey to open the file explorer
nnoremap <C-B> :NvimTreeToggle<cr>
nnoremap <C-O> :NvimTreeFocus<cr>
nnoremap <C-L> :call setqflist([])<cr>

" Move to previous/next
nnoremap <silent>    <A-Left> :BufferPrevious<CR>
nnoremap <silent>    <A-Right> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <C-A-Left> :BufferMovePrevious<CR>
nnoremap <silent>    <C-A-Right> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferGoto 9<CR>
nnoremap <silent>    <A-0> :BufferLast<CR>

" Close buffer
nnoremap <silent>    <A-w> :BufferClose<CR>

nnoremap <silent>   <C-S-p> <cmd>Telescope<cr>
nnoremap <silent>   <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent>   <C-S-s> <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent>   <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent>   <C-S-f> <cmd>Telescope live_grep<cr>
nnoremap <silent>   <C-S-d> <cmd>Telescope diagnostics<cr>
nnoremap <silent>   <A-Space> <cmd>Telescope buffers<cr>
nnoremap <silent>   <C-t> <cmd>Telescope oldfiles<cr>

nnoremap <silent>   <C-A-r> <cmd>source $MYVIMRC<cr>

nnoremap <Tab> <C-w>w
nnoremap <C-S-v> <C-w>j
nnoremap <C-S-h> <C-w>q

" Keybindings to move lines
" 
xnoremap <C-S-Up>     :m-2<CR>gv=gv
xnoremap <C-S-Down>   :m'>+<CR>gv=gv

" move current line up one line
nnoremap <C-S-Up>  :<C-u>m-2<CR>==

" move current line down one line
nnoremap <C-S-Down> :<C-u>m+<CR>==

nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
 
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>

map <C-a> <esc>ggVG<CR>

" Duplicate the current line
nnoremap <A-d> <ESC>Yp

" Delete current line
nnoremap <C-Delete> <ESC>dd

" Tradicional CTRL-C, CTRL-V and CTRL-X behaviors
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

vmap <Tab> >gv
vmap <S-Tab> <gv

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'  

nnoremap <silent> <C-Enter> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <S-Space> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <A-Enter> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>


" Quick-fix
nnoremap <silent> <C-`>    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <C-'>    <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

noremap <C-S>          :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-O>:update<CR>

noremap <C-Q>          :q<CR>
vnoremap <C-Q>         <C-C>:q<CR>
inoremap <C-Q>         <C-O>:q<CR>

nnoremap <C-Z> u
nnoremap <C-S-Z> <C-R>
nnoremap <C-Y> <C-R>

inoremap <C-Z> <C-O>u
inoremap <C-S-Z> <C-O><C-R>
inoremap <C-Y> <C-O><C-R>

map <C-G> <ESC>:

"Toggle comments
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv

map <C-A-J> <cmd>TroubleToggle<cr>

" Trigger CoC format 
vmap <C-S-f>  <Plug>(coc-format-selected)
nmap <C-S-f>  <Plug>(coc-format-selected)




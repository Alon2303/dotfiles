syntax on
set number
" tabs
set showtabline=2
set tabstop=4
set softtabstop=4
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>
set relativenumber
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent
set nocompatible
filetype on
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html'] }
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
call vundle#end()

filetype plugin indent on
" close NERDTree after a file is opened
 let g:NERDTreeQuitOnOpen=1
" " show hidden files in NERDTree
 let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable="-"
let NERDTreeDirArrowCollapsible="|"
" " Toggle NERDTree
 nmap <silent> <leader>k :NERDTreeToggle<cr>
" " expand to the path of the file in the current buffer
 nmap <silent> <leader>y :NERDTreeFind<cr>
 autocmd VimEnter * NERDTree
 colorscheme torte
nmap <leader>t :tabnew<cr>

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeoutcs=200
	let g:lsp_semantic_enabled=1
" "   autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" Only register clangd if it’s on your PATH
if executable('clangd')
  augroup lsp_clangd
    autocmd!
    " Tell vim-lsp to use clangd for C / C++ / Obj-C / Obj-C++
    autocmd User lsp_setup call lsp#register_server({
          \ 'name':        'clangd',
          \ 'cmd':         {server_info->['clangd']},
          \ 'whitelist':   ['c', 'cpp', 'objc', 'objcpp'],
          \ })
    " Use Vim’s omni-completion for those filetypes
    autocmd FileType c,cpp,objc,objcpp setlocal omnifunc=lsp#complete
  augroup END
endif
let g:lsp_log_verbose=1

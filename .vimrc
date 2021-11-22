syntax on

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
call vundle#end()
filetype plugin indent on
" close NERDTree after a file is opened
 let g:NERDTreeQuitOnOpen=0
" " show hidden files in NERDTree
 let NERDTreeShowHidden=0
" " Toggle NERDTree
 nmap <silent> <leader>k :NERDTreeToggle<cr>
" " expand to the path of the file in the current buffer
 nmap <silent> <leader>y :NERDTreeFind<cr>
 autocmd VimEnter * NERDTree
nmap <leader>t :newtab<cr>

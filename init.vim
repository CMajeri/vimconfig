call plug#begin()
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nanotech/jellybeans.vim'
Plug 'ap/vim-buftabline'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'qpkorr/vim-bufkill'
call plug#end()

"Colors
syntax enable
colorscheme jellybeans

filetype plugin on


"Switch between windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"Switch between tabs
nnoremap <C-S-Left> :BP<CR>
nnoremap <C-S-Right> :BN<CR>
inoremap <C-S-Left>  <ESC>:BP<CR>
inoremap <C-S-Right> <ESC>:BN<CR>
nnoremap <F28>    :BD<CR>


"Copy/paste to system
vmap <C-S-x> "+x
vmap <C-S-c> "+y
imap <C-v> "+gP

"Saving buffers
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>i


"Commenter
vmap <C-_> <Plug>NERDCommenterToggle
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1


"NerdTree
:set mouse=a
let g:NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='t'
let g:nerdtree_tabs_open_on_console_startup=1
nmap <C-n>  :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

"vim-go
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_gofmt_autosave = 1
nmap <C-LeftMouse> :GoDef<CR>
imap <C-LeftMouse> <ESC>:Godef<CR>

"Autocomplete
set completeopt-=preview

"Sessions saving
let g:session_directory="~/.vim/sessions"

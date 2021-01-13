syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set incsearch

"Needed for tmux
"https://gist.github.com/gutoyr/4192af1aced7a1b555df06bd3781a722
set t_ZH=[3m
set t_ZR=[23m

set tw=80
"set colorcolumn=80

set t_Co=256
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
"https://dev.to/rajat_naegi/configure-you-complete-me-and-ultisnips-for-vim-and-their-integration-4plf
"Plug 'ycm-core/YouCompleteMe'
"First clone for NERDTree git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
Plug 'preservim/nerdtree'
Plug 'joom/vim-commentary'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Required plug ins for snippets (enigne and snippets)
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"We need this line in order to see mispelled words
"https://github.com/morhetz/gruvbox/issues/175
let g:gruvbox_italic=1
let g:gruvbox_guisp_fallback = "bg"


"colorscheme dracula
colorscheme gruvbox
set background=dark

if has('mouse')
  set mouse=a
endif

" Find
map <C-f> /

" Ctrl+c copy and Ctrl+v paste
vnoremap <C-c> "+y
vnoremap <C-v> "+gP

" comment / decomment & normal comment behavior
"vnoremap <C-m> gc
vmap <C-m> gc

"To move to a misspelled word, use ]s and [s
"z= to check for correct ones
nnoremap <F6> :setlocal spell spelllang=en_us<CR>

" Map Ctrl-a to select all
nnoremap <C-a> ggVG

"Use F8 for enabling wrap text
nnoremap <F8> :set wrap!<CR>

"C-w C-r swaps buffers vertically
"If you have them split horizontally C-w L to move one to the right
"If you have them split vertically C-w J to move one to the bottom

" ss splits horizontally
" sv splits vertically
set splitright
set splitbelow
nmap ss :new<Return>
nmap sv :vnew<Return>
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

let mapleader = " " "space
"nnoremap <silent> 



"the vim option updatetime to a smaller value, which is the frequency that the 
"output PDF is updated
autocmd Filetype tex setl updatetime=1
"Prevent recompilation on cursor hold 
let g:livepreview_cursorhold_recompile = 0

" Trigger configuration. We need to change this to something other than <tab>
" since we use YoucopleteM
" - https://github.com/Valloric/YouCompleteMe
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
"let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<S-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-k>"
let g:tex_flavor = "latex"

filetype plugin indent on
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent
"let g:indentLine_setColors = 0
let g:indentLine_char = '|'

" https://dev.to/hayden/optimizing-your-workflow-with-fzf-ripgrep-2eai
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
nnoremap \ :Rg<CR>
nnoremap <C-t> :Files<cr>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

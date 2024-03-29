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
set hidden
set scrolloff=7
set backspace=indent,eol,start

"Needed for tmux
"https://gist.github.com/gutoyr/4192af1aced7a1b555df06bd3781a722
set t_ZH=[3m
set t_ZR=[23m

set laststatus=2
set tw=80
"set colorcolumn=80

set t_Co=256
"set encoding=utf8

let mapleader = " " "space
"nnoremap <silent> 
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'leafgarland/typescript-vim'
Plug 'mhinz/vim-startify'
Plug 'karb94/neoscroll.nvim'
Plug 'farmergreg/vim-lastplace'
"https://dev.to/rajat_naegi/configure-you-complete-me-and-ultisnips-for-vim-and-their-integration-4plf
" Plug 'ycm-core/YouCompleteMe'
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
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-floaterm'
Plug 'easymotion/vim-easymotion'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"We need this line in order to see mispelled words
"https://github.com/morhetz/gruvbox/issues/175
" let g:gruvbox_italic=1
let g:gruvbox_guisp_fallback = "bg"

" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>f :NERDTreeFind<bar> :vertical resize 30<CR>
"let g:webdevicons_enable = 0
let g:NERDTreeStatusline = '' " set to empty to use lightline
let g:NERDTreeHighlightFolders = 1

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
" https://vi.stackexchange.com/questions/28120/vim-spellcheck-not-working
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
" let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<S-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-k>"
let g:tex_flavor = "latex"
let g:UltiSnipsListSnippets= "<Leader><tab>"


filetype plugin indent on
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"let g:indentLine_setColors = 0
let g:indentLine_char = '|'

" https://dev.to/hayden/optimizing-your-workflow-with-fzf-ripgrep-2eai
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
nnoremap \ :Rg<CR>
nnoremap <C-p> :Files<cr>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
let g:rg_derive_root='true'



set showtabline=2
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.colorscheme = "gruvbox"
" Move between buffers with leader key (space)
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" Close buffer
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

"Ctrl-d in nomral mode selectes the same word
"Ctrl-d-<F2> selects all same words
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<C-d><F2>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<C-d><F2>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:floaterm_keymap_new    = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>t'
vnoremap  <Leader>s :'<,'>FloatermSend<Return>

" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" Disable conceal regardless of conceallevel setting,
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 0
let g:vim_markdown_conceal_code_blocks = 0
" DIsable folding
let g:vim_markdown_folding_disabled = 1


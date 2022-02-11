call plug#begin('~/.config/nvim/plugged')
" Plugins go here
Plug 'vim-airline/vim-airline'
Plug 'zivyangll/git-blame.vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-analyzer/rust-analyzer'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'rust-analyzer/rust-analyzer'
Plug 'valloric/youcompleteme'
Plug 'kien/ctrlp.vim'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'

Plug 'jez/vim-better-sml'

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()

set encoding=UTF-8

syntax on
colorscheme gruvbox

filetype plugin indent on
set mouse=a
set showmatch
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set number
set autoindent
set noshowmode
set laststatus=2
set wrap linebreak
set ignorecase
set smartcase
set shiftround
set splitbelow splitright
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set modifiable
set guifont=3270Medium\ Nerd\ Font\ Medium
set list lcs=tab:\|.

let g:python3_host_prog = '/usr/local/bin/python3'
let python_highlight_all=1

" move to beginning/end of line
nnoremap B ^
nnoremap E $

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.go, *.ts, *.rs match BadWhitespace /\s\+$/

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" you complete me
let g:ycm_autoclose_preview_window_after_completion=1
autocmd FileType typescript map <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd FileType javascript map <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd FileType python map <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd FileType rust map <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd FileType c map <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" go settings
let g:go_fmt_command="goimports"
let g:go_highlight_types=1
let g:go_highlight_function_calls=1
let g:go_highlight_structs=1
let g:go_highlight_interfaces=1
let g:go_def_mod='gopls'
let g:go_info_mod='gopls'
let g:indent_guides_guide_size=1
"
" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>
" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1
" open nerdtree automatically only if directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" rainbow parens
let g:rainbow_active = 1

" rust plugin
let g:rustfmt_autosave = 1

" syntastic
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_python_checker = ['flake8']
let g:syntastic_python_python_exec = 'python3'

" flake8 python linting
let g:flake8_show_in_gutter=1
let g:flake8_show_quickfix=1
let g:flake8_show_in_file=1
autocmd BufWritePost *.py call flake8#Flake8()

" gutentags
let g:gutentags_ctags_exclude = ["node_modules"]

" go build/fmt on save
autocmd BufWritePost *.go call GoOnSave()
function GoOnSave()
    :GoBuild
    :GoMetaLinter
    :GoFmt
endfunction

" set modifiable when entering terminal
autocmd TermOpen * setl ma

" commands to run before writing buffer to file on js/ts/tsx files
autocmd BufWritePre *.ts,*.js,*.tsx call JsOnSave()
function JsOnSave()
    :Prettier
endfunction

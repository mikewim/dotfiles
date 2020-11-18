set nocompatible
set backspace=indent,eol,start
set autoindent
set ruler
set showcmd  " show command in bottom bar
set number " show line numbers
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
set visualbell noerrorbells                " don't beep
set sw=4 " shift width used for < and > tabs space
set tabstop=4 shiftwidth=4 softtabstop=4
set list lcs=tab:\|\ 
set background=dark

syntax enable 

"highlight
nnoremap <Leader>h :exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))<cr>
nnoremap <Leader>H :exe printf('match IncSearch /\V\<%s\>/', escape(expand(''), '/\'))<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" allows for plugins to be loaded
filetype plugin indent on

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" easier escape
inoremap jk <Esc>

" ------------------- PLUGIN CONFIGS ---------------------

" color scheme
colorscheme gruvbox
" packadd! dracula
" colorscheme dracula
"
" open nerdtree automatically only if directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" vim-airline
let g:airline#extensions#tabline#enabled = 1

" rainbow parens
let g:rainbow_active = 1

" vim-go
let g:go_list_type = "quickfix"
let g:go_auto_sameids = 0
let g:go_metalinter_autosave_enabled = []
let g:go_rename_command='gopls'
let g:go_gopls_complete_unimported = 1
let g:go_implements_mode='gopls'
let g:go_diagnostics_enabled = 1
let g:go_doc_popup_window = 1
let g:go_gocode_propose_source = 1
let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []
let g:go_def_mode='gopls'
let g:go_imports_mode='gopls'
let g:go_imports_autosave=1
let g:go_fmt_autosave = 0
let g:go_fmt_options = { 'gofmt': '-s' }
let g:go_fmt_command = "goimports"
let g:go_info_mode='gopls'
let g:go_auto_type_info = 0
let g:go_metalinter_enabled = []
let g:go_updatetime = 400
let g:go_fmt_experimental = 1
let g:go_echo_command_info=0
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1

autocmd BufWritePost *.go call GoOnSave()
function GoOnSave()
	:GoBuild
	:GoMetaLinter
	:GoFmt
endfunction

" Rust support
let g:rustfmt_autosave = 1

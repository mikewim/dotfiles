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

syntax enable 
set background=dark

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

" toggle gundo (graphical display of undo tree)
nnoremap <leader>u :GundoToggle<CR>

" easier escape
inoremap jk <Esc>l

" PLUGIN CONFIGS

" color scheme
" colorscheme gruvbox
packadd! dracula
colorscheme dracula

" vim-airline
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1

let g:go_fmt_fail_silently = 1
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

" let g:ale_linters = {'go': ['gobuild']}
"let g:ale_linters = {'go': ['govet', 'gobuild', 'gopls']}
"let g:ale_fixers  = {'go': ['trim_whitespace', 'goimports','gofmt']}
"let g:ale_fix_on_save = 1
"" Only run linters named in ale_linters settings.
"let g:ale_linters_explicit = 1
"let g:ale_lint_on_insert_leave = 0
"" You can disable this option too
"" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0
"" highlight link ALEErrorLine Error
"highlight link ALEError Error
"highlight link ALEInfo Error
"highlight link ALEStyleError  Error
"highlight link ALEStyleWarning Error
"highlight link ALEVirtualTextError Error
"highlight link ALEVirtualTextInfo Error
"highlight link ALEVirtualTextStyleError Error
"highlight link ALEVirtualTextStyleWarning Error
"highlight link ALEVirtualTextWarning Error
"highlight clear ALEWarning
"


" open nerdtree automatically only if directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

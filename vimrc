set nocompatible
filetype off

let vimcustom = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
let vimcustombundle = vimcustom . '/bundle/'
let vimcustomvundle = vimcustombundle . '/vundle/'

let &runtimepath.=',' . vimcustom . ',' . vimcustomvundle

set rtp+=&runtimepath
set rtp+=/usr/local/opt/fzf

call vundle#begin(vimcustombundle)

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-vinegar'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gagoar/StripWhiteSpaces'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'roman/golden-ratio'
Plugin 'mattn/emmet-vim'
Plugin 'ajh17/spacegray.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'w0rp/ale'
Plugin 'Quramy/tsuquyomi'
Plugin 'kshenoy/vim-signature'
Plugin 'cocopon/iceberg.vim'
Plugin 'AndrewRadev/splitjoin.vim'
" Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
" Plugin 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'prettier/vim-prettier'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'Shougo/echodoc.vim'
" Plugin 'google/vim-maktaba'
" Plugin 'google/vim-codefmt'
" Plugin 'google/vim-glaive'

call vundle#end()
filetype plugin indent on

" Ag configuration
let g:ag_working_path_mode="r"

colorscheme iceberg
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 1

" defaults
set tags=tags
set clipboard=unnamed
set encoding=utf-8
set fileencoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set history=100
set undolevels=1000
set noswf
set noshowmode
set backspace=indent,eol,start
set cursorline
set number
set autoread
set wildignore+=*/examples/*,*/tmp/*,*/_site/*,*/bower_components/*,*/node_modules/*,*/dist/*,*.so,*.swp,*.zip,*/.git/*,*/coverage/*,*ckeditor*/,tags,*/logs/*,*/build/*,
set splitbelow
set splitright
set scrolloff=5
set wildmenu
set smartcase
set ttyfast
syntax enable

" EMMET
let g:user_emmet_leader_key='\'

" Multi Cursor
let g:multi_cursor_exit_from_insert_mode = 0

" NERDTree
let NERDTreeQuitOnOpen=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeIgnore = ['^node_modules$', '^dist$']

" Statusline
set statusline=
set statusline=[%n] "buffer mode
set statusline+=\ \%#warningmsg#
set statusline+=%*
set statusline+=%f              "filename
set statusline+=%m              "modified flag
set statusline+=%r              "read only flag
set statusline+=\ \%y           "filetype
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%=              "left/right separator
set statusline+=%*              "show the errors/warning in the status line
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=              "left/right separator
set statusline+=%h\ \           "help file flag
set statusline+=[%l,%c]         "cursor line,column
set statusline+=\ \|%L\ lines\| "total lines
set statusline+=\ %P            "percent through file
set laststatus=2

" Ctrl + p custom
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" TypeScript configuration
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_shortest_import_path = 1

" My Custom remaps
noremap <silent><CR> :let @*=@%<CR>
noremap Q :q<CR>
noremap e ea
noremap <leader>i <Esc>:TsuImport<CR>
noremap <leader>f <Esc>"9yiw :Ag! <C-R>9<CR>

nnoremap <silent><tab> :tabnext<CR>
nnoremap <silent><bs> :ccl<CR>
nnoremap <silent>s :w<CR>
nnoremap <space> :NERDTreeToggle %<CR>
nnoremap <space><space> :NERDTreeFind<CR>

com! Json :%!python -m json.tool

" My abbreviations
iabbrev lenght length

" This command now supports CTRL-T, CTRL-V, and CTRL-X key bindings
" and opens fzf according to g:fzf_layout setting.
command! Buffers call fzf#run(fzf#wrap(
    \ {'source': map(range(1, bufnr('$')), 'bufname(v:val)')}))
"
" FZF Commands
noremap <C-p> <Esc>:FZF<CR>
noremap <C-b> <Esc>:Buffers<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

set background=dark

" Rust
set cmdheight=1
let g:echodoc_enable_at_startup = 1
let g:rustfmt_autosave = 1
set hidden

let $RUST_SRC_PATH="/Users/rvieira/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library"
let g:racer_cmd = "/Users/rvieira/.cargo/bin/racer"
let g:racer_experimental_completer = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> <C-]>         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END


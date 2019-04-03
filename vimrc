set nocompatible
filetype off

let vimcustom = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
let vimcustombundle = vimcustom . '/bundle/'
let vimcustomvundle = vimcustombundle . '/vundle/'

let &runtimepath.=',' . vimcustom . ',' . vimcustomvundle

set rtp+=&runtimepath

call vundle#begin(vimcustombundle)

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-vinegar'
Plugin 'wellle/targets.vim'
Plugin 'ctrlpvim/ctrlp.vim'
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
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'w0rp/ale'
Plugin 'Quramy/tsuquyomi'
Plugin 'kshenoy/vim-signature'
Plugin 'cocopon/iceberg.vim'

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
set wildignore+=*/examples/*,*/tmp/*,*/_site/*,*/bower_components/*,*/node_modules/*,*.so,*.swp,*.zip,*/.git/*,*/coverage/*,*ckeditor*/,tags,*/logs/*,*/build/*,
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

" My abbreviations
iabbrev lenght length

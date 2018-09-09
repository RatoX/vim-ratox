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
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'groenewege/vim-less'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-ruby/vim-ruby'
Plugin 'gagoar/StripWhiteSpaces'
Plugin 'digitaltoad/vim-jade'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'moll/vim-node'
Plugin 'chase/vim-ansible-yaml'
Plugin 'roman/golden-ratio'
Plugin 'luochen1990/rainbow'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-pug'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'morhetz/gruvbox'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-syntastic/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'mxw/vim-jsx'
Plugin 'git-time-metric/gtm-vim-plugin'

call vundle#end()
filetype plugin indent on

let g:vue_disable_pre_processors=1

" Ag configuration
let g:ag_working_path_mode="r"

" Color Scheme
set t_Co=256

colorscheme gruvbox
set background=dark

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
set wildignore+=*/tmp/*,*/_site/*,*/bower_components/*,*/node_modules/*,*.so,*.swp,*.zip,*/.git/*,*/coverage/*,*ckeditor*/,tags,*/logs/*,*/build/*,
set splitbelow
set splitright
set scrolloff=5
set wildmenu
set smartcase
syntax enable

" EMMET
let g:user_emmet_leader_key='\'

" Custom Functions
com! Json :%!python -m json.tool

" JavaScript Flow
let g:javascript_plugin_flow = 1

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

" Rainbow
let g:rainbow_active = 1


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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=              "left/right separator
set statusline+=%h\ \           "help file flag
set statusline+=[%l,%c]         "cursor line,column
set statusline+=\ \|%L\ lines\| "total lines
set statusline+=\ %P            "percent through file
set laststatus=2

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let syntastic_mode_map = { 'passive_filetypes': ['html', 'sass'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'

if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif

if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
  let g:syntastic_vue_eslint_exec = local_eslint
endif

" My Custom remaps
noremap <silent><CR> :let @*=@%<CR>
noremap Q :q<CR>
noremap j gj

nnoremap <silent><tab> :tabnext<CR>
nnoremap <silent><bs> :ccl<CR>
nnoremap <silent>s :w<CR>
nnoremap <space> :NERDTreeToggle %<CR>

" My abbreviations
iabbrev lenght length


" set local configuration to avoid conflict with coffee script plugin
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.spec.js iabbrev <buffer> it() it ('', () => {
  \<CR>})<Esc>O


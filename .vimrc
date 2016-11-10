filetype off                  " required

set paste " Por padrão quero modo de colar legal
set encoding=utf-8
set fileencoding=utf-8
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set history=100
set undolevels=1000
set noswf
set noshowmode
set backspace=indent,eol,start
set cursorline
set number
set autoread
set wildignore+=*/tmp/*,*/_site/*,*/bower_components/*,*/node_modules/*,*.so,*.swp,*.zip,*/.git/*,*/coverage/*
set splitbelow
set splitright
set relativenumber
set scrolloff=5
set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize

set rtp+=~/vim-ratox/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" vim coisas
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'elzr/vim-json'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-ruby/vim-ruby'
Bundle 'gagoar/StripWhiteSpaces'
Bundle 'digitaltoad/vim-jade'
Bundle 'airblade/vim-gitgutter'
Bundle 'rking/ag.vim'
Bundle 'moll/vim-node'
Bundle 'flazz/vim-colorschemes'
Bundle 'chase/vim-ansible-yaml'
Bundle 'roman/golden-ratio'
Bundle 'luochen1990/rainbow'
Bundle 'briancollins/vim-jst'
Bundle 'digitaltoad/vim-pug'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme monokai


" Ag
let g:ag_working_path_mode="r"

"barra de status
set statusline=
set statusline=[%n] "buffer mode
set statusline+=\ \%#warningmsg#


" set the format of the status line

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


"NERDTree coisas
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeQuitOnOpen=1


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


"Colorindo automaticamente apenas esses arquivos
let g:colorizer_auto_filetype='css,html,vim'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']

let g:multi_cursor_exit_from_insert_mode = 1
nmap <C-S> <Esc>:%s/\t/  /g<CR>
noremap <silent><CR> :let @*=@%<CR>
let g:rainbow_active = 1

noremap Q <nop>


function! ToggleNumbersOn()
    set relativenumber!
    set number
endfunction

function! ToggleRelativeOn()
    set number
    set relativenumber
endfunction

autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn()
autocmd InsertLeave * call ToggleRelativeOn()

noremap s :w<CR>

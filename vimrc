set nocompatible
filetype off
syntax on

set rtp+=~/vim-ratox/
set rtp+=~/vim-ratox/bundle/vundle/

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
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
Plugin 'crusoexia/vim-monokai'
Plugin 'chase/vim-ansible-yaml'
Plugin 'roman/golden-ratio'
Plugin 'luochen1990/rainbow'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-pug'
Plugin 'klen/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'

call vundle#end()
filetype plugin indent on

runtime! config/*.vim

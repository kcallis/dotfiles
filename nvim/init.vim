set clipboard+=unnamedplus

" Don't use the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" no swap file
set noswapfile

" save undo-tree in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000



" use 4 spaces instead of tab ()
" Copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show substitution
set inccommand=nosplit

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
" turn hybrid line numbers on
	set number relativenumber
augroup numbertoogle
    autocmd!
    autocmd BufEnter,FocusGained,Insertleave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=75
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Plugins

if ! filereadable(system('echo -n "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $XDG_CONFIG_HOME/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "$XDG_CONFIG_HOME/nvim/plugged"')) 

	Plug 'junegunn/goyo.vim'
	

call plug#end()

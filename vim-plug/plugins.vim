"" Install plugins with https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/autoload/plugged')

" Can't live without
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Nice to have
Plug 'tpope/vim-vinegar'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

" Elixir and Phoenix
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
" Plug 'slashmili/alchemist.vim'
" Plug 'Shougo/deoplete.nvim'

" Ruby and Rails
" Plug 'tpope/vim-rails'
" Plug 'kchmck/vim-coffee-script'

" Javascript
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Markdown
Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown' }

" UI Plugins
" Plug 'arcticicestudio/nord-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'itchyny/lightline.vim'

call plug#end()

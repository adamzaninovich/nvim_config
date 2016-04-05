"" Install plugins with https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')

" To try at some point
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neco-vim'

" Can't live without
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'epmatsw/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

" Extra nice
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'lucidstack/ctrlp-mpc.vim'

" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Elixir and Phoenix
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }
Plug 'powerman/vim-plugin-AnsiEsc' | Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Javascript
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mtscout6/vim-cjsx', { 'for': 'javascript' }

" Markdown
Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown' }

" UI Plugins
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline', { 'commit': 'ce44577' }

call plug#end()

"" Basic Config

set visualbell
set hidden
set number
set relativenumber
set nowrap
set cursorline
set tabstop=4 shiftwidth=2 softtabstop=2 expandtab
let mapleader=","

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Set windows up
set winwidth=85 colorcolumn=81 list listchars=tab:▸\ ,trail:•,nbsp:⋅

" Colors
set background=dark
colorscheme gruvbox

" Spelling
autocmd FileType markdown set spell
autocmd FileType markdown set spell spelllang=en_us
autocmd FileType markdown set complete+=kspell
autocmd FileType gitcommit set spell
autocmd FileType gitcommit set spell spelllang=en_us
autocmd FileType gitcommit set complete+=kspell

"" Plugin Customizations

" AirLine
set laststatus=2 " enable airline even if no splits
set showcmd
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline#extensions#tabline#enabled = 0 " set 1 for buffer line
let g:bufferline_echo = 0
let g:airline_mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'REPLACE',
      \ 'v' : 'VISUAL',
      \ 'V' : 'V-LINE',
      \ 'c' : 'CMD   ',
      \ '': 'V-BLCK',
      \ }

" CtrlP
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_extensions = ['mpc']
call ctrlp_bdelete#init()

" Use fenced code blocks in markdown
let g:markdown_fenced_languages=['ruby', 'javascript', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set textwidth=80

"" MISC KEY MAPS

" Sheer awesomeness
nnoremap <Leader>m :CtrlPMpc<CR>

" CtrlP buffer
nnoremap <leader>b :CtrlPBuffer<cr>

" convert stupid 18 syntax
map <leader>19 :%s/:\(\w*\)\s*=>\s*/\1: /gci<cr>
map <leader>19! :%s/:\(\w*\)\s*=>\s*/\1: /gi<cr>

" search with Ag
noremap <leader>a :Ag<space>

" no-op fucking Q
nmap Q <nop>

" quit all other splits
nmap <silent> <leader>q :only<cr>

" fix whitespace
nmap <silent> <leader>w m`:%s/\s\+$//e<cr>``:noh<cr>

" Edit this file
nmap <silent> <leader>v :vsp $MYVIMRC<cr>

" Map tab and shift-tab to switch buffers.
nmap <silent> <tab> :bn<cr>
nmap <silent> <S-tab> :bp<cr>

" easy buffer switching
nnoremap <silent> <leader><leader> <c-^>

" Easier window nav
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l

" Vim Test Mappings
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>

"" neovim-specific config
if has("nvim")
  let $SIMPLE_PROMPT=1

  " change cursor to bar in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " fuck mouse support, what am I a vimposer?
  set mouse-=a

  " run tests with :T
  let test#strategy="neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_position="vertical"

  nnoremap <silent> <leader>c :Tclose<cr>

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>

  " optional: make it easier to switch between terminal splits
  " ctrl doesn't work for some reason so I use alt
  " I think the terminal is capturing ctrl and not bubbling to vim or something
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

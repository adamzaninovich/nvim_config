"" Install plugins with https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')

" To try at some point
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
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'

" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'

" Elixir and Phoenix
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'slashmili/alchemist.vim'
Plug 'Shougo/deoplete.nvim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim'

" Javascript
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mtscout6/vim-cjsx', { 'for': 'javascript' }
Plug 'ElmCast/elm-vim'

" Crystal
Plug 'rhysd/vim-crystal'

" Markdown
Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown' }

" Trying Out
Plug 'airblade/vim-gitgutter'

" UI Plugins
" Plug 'whatyouhide/vim-gotham'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

call plug#end()

"" Basic Config

set updatetime=100
set visualbell
set hidden
set number
set relativenumber
set nowrap
set cursorline
set smartcase
set tabstop=4 shiftwidth=2 softtabstop=2 expandtab
let mapleader=","

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Window
set winwidth=84 colorcolumn=81 list listchars=tab:▸\ ,trail:•,nbsp:⋅

set foldmethod=syntax
set nofoldenable

" Spelling
" autocmd FileType markdown set spell
" autocmd FileType markdown set spell spelllang=en_us
" autocmd FileType markdown set complete+=kspell

" Set formating program to use par
"   use the gq command to format text (gqip ftw)
if executable('par')
  set formatprg=par\ -w65
endif

" Autocommands
autocmd FileType markdown set textwidth=80 colorcolumn=81
autocmd FileType gitcommit set textwidth=50 colorcolumn=51
" autocmd FileType gitcommit set spell spelllang=en_us complete+=kspell

" Colors
" set t_Co=256
" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set background=dark " Setting dark mode
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

"" Plugin Customizations

" Lightline
set laststatus=2 " enable lightline even if no splits
set showcmd
set noshowmode
let g:bufferline_echo = 0
let g:lightline = { 'colorscheme': 'nord' }

" Elm
let g:elm_format_autosave = 1

" CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
call ctrlp_bdelete#init()

" Use fenced code blocks in markdown
let g:markdown_fenced_languages=['ruby', 'javascript', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown


"" MISC KEY MAPS

" inoremap kj <esc>

" CtrlP buffer
nnoremap <leader>b :CtrlPBuffer<cr>

nnoremap <leader>h "adiw:r!mix hex.info <C-r>a <bar> sed -n 's/Config\:\ // p'<cr>kJ

" convert stupid ruby 1.8 hash syntax
nnoremap <leader>19 :%s/:\(\w*\)\s*=>\s*/\1: /gci<cr>
nnoremap <leader>19! :%s/:\(\w*\)\s*=>\s*/\1: /gi<cr>

" search with Ag
nnoremap <leader>a :Ag<space>

" no-op fucking Q
nnoremap Q <nop>

" quit all other splits
nnoremap <silent> <leader>o :only<cr>

" fix whitespace
" nnoremap <silent> <leader>w m`:%s/\s\+$//e<cr>``:noh<cr>
nnoremap <silent> <leader>w m`:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:noh<cr>``

" Edit this config file
nnoremap <silent> <leader>v :vsp $MYVIMRC<cr>

" Map tab and shift-tab to switch buffers.
nnoremap <silent> <tab> :bn<cr>
nnoremap <silent> <S-tab> :bp<cr>

" easy buffer switching
nnoremap <silent> <leader><leader> <c-^>

" Easier window nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" turns 'thing' into 'let(:thing) { double(:thing) }'
autocmd FileType ruby nnoremap <buffer> <leader>l $Bveyilet(:<esc>A) { double(:<esc>pA) }<esc>

" Vim Test Mappings
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>

autocmd FileType elixir nnoremap <buffer> <leader>p Orequire IEx; IEx.pry()<esc>

autocmd FileType elixir nnoremap <buffer> <leader>d o@doc """<c-m>Documentation<c-m>"""<esc>kviw
" Elixir - autoformat elixir if the current elixir version is 1.6.5 or above
let s:elixir_version = system("elixir --version|tail -1")
if s:elixir_version =~ '1.6.[5-9]'
  autocmd BufWritePost *.exs silent call RunElixirFormatter()
  autocmd BufWritePost *.ex silent call RunElixirFormatter()

  function RunElixirFormatter()
    :!mix format %
    :e
    :syntax on
  endfunction
endif

"" neovim-specific config
if has("nvim")
  let $SIMPLE_PROMPT=1

  " change cursor to bar in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " fuck mouse support, what am I a vimposer?
  set mouse-=a

  " run tests with :T
  let test#strategy = "neoterm"

  let g:neoterm_default_mod = "horizontal rightbelow"

  map <silent> <leader>c :T mix credo<CR>
  map <silent> <leader>q :Ttoggle<CR>

  " vertical split instead of the default horizontal
  " let g:neoterm_position="vertical"

  " Toggle Neoterm Position
  " function NeotermTogglePosition()
  "   if g:neoterm_position ==? "vertical"
  "     let g:neoterm_position="horizontal"
  "     echom "Set neoterm position to horizontal"
  "   else
  "     let g:neoterm_position="vertical"
  "     echom "Set neoterm position to vertical"
  "   endif
  "   T exit
  " endfunction
  " nnoremap <leader>z :call NeotermTogglePosition()<cr>
  "
  " nnoremap <silent> <leader>c :Ttoggle<cr>
  " nnoremap <silent> <leader>o :Topen<cr>

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

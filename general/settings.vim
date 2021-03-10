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

" Store temporary files in a central spot
set backup
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp

" Show file options above the command line
" (This is default with nvim, but fuck it, let's be explicit)
set wildmenu

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" Window
set winwidth=84 colorcolumn=81 list listchars=tab:▸\ ,trail:•,nbsp:⋅

" Folding - TODO still needs work
set foldmethod=syntax
set nofoldenable

" no mouse support, what am I a vimposer?
set mouse-=a

" Set formating program to use par
"   use the gq command to format text (gqip ftw)
if executable('par')
  set formatprg=par\ -w65
endif

" Special file formatting
autocmd FileType markdown set textwidth=80 colorcolumn=81
autocmd FileType gitcommit set textwidth=50 colorcolumn=51

" change cursor to bar in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader=","

"" MISC KEY MAPS

" Use alt + hjkl to resize windows
nnoremap <silent> <A-j>    :resize -2<cr>
nnoremap <silent> <A-k>    :resize +2<cr>
nnoremap <silent> <A-h>    :vertical resize -2<cr>
nnoremap <silent> <A-l>    :vertical resize +2<cr>

" FZF Files
nnoremap <silent> <c-p> :Files<cr>

" FZF Buffer
nnoremap <leader>b :Buffer<cr>

" project search with Rg
nnoremap <leader>a :Rg<space>

" no-op fucking Q
nnoremap Q <nop>

" convert stupid ruby 1.8 hash syntax
autocmd FileType ruby nnoremap <leader>19 :%s/:\(\w*\)\s*=>\s*/\1: /gci<cr>
autocmd FileType ruby nnoremap <leader>19! :%s/:\(\w*\)\s*=>\s*/\1: /gi<cr>

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
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" Vim Test Mappings
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>

" adds a <%= %>
autocmd FileType eelixir nnoremap <buffer> <leader>s i<%= %><esc>hhi<space>

" adds a pry
autocmd FileType elixir nnoremap <buffer> <leader>p Orequire IEx; IEx.pry()<esc>

" format a dep
autocmd FileType elixir nnoremap <leader>h "adiw:r!mix hex.info <C-r>a <bar> sed -n 's/Config\:\ // p'<cr>kJ

" make a @doc
autocmd FileType elixir nnoremap <buffer> <leader>d o@doc """<c-m>Documentation<c-m>"""<esc>kviw

" terminal config
if has("nvim")
  map <silent> <leader>c :T mix credo<CR>
  map <silent> <leader>q :Ttoggle<CR>

  " pretty much essential: by default in terminal mode, you have to press
  " ctrl-\-n to get into normal mode ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>

  " optional: make it easier to switch between terminal splits
  " ctrl doesn't work for some reason so I use alt
  " I think the terminal is capturing ctrl and not bubbling to vim or
  " something
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

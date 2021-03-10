" fzf
" TODO: change to Rg?
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Rust - autoformat
let g:rustfmt_autosave = 1

" Elixir - autoformat
function RunElixirFormatter()
  :!mix format %
  :e
  :syntax on
endfunction

autocmd BufWritePost *.exs,*.ex silent call RunElixirFormatter()

" vim-flavored-markdown.vim
" Use fenced code blocks in markdown
let g:markdown_fenced_languages=['ruby', 'javascript', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang', 'elixir']
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown

" vim-test
let test#strategy = "neoterm"

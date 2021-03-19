set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Personal edits
set nu splitbelow splitright
" FoldColumn = fdc
hi FoldColumn guifg=pink
" fold method manual
set fdm=manual
nnoremap <Leader>b :echo bufnr('%')<CR>
nnoremap <Leader>s :SyntasticToggleMode<CR>
runtime macros/matchit.vim " Matches do and end in Ruby for %

set mouse=n
set ttymouse=xterm2

" Indents
filetype plugin indent on
set sw=4 sts=4 ts=4 et 
set cin
" au FileType javascript setl sw=4 sts=4 ts=4
" au FileType typescript,yaml,html,css,scss,json setl sw=2 sts=2 ts=2
au FileType javascript,typescript,yaml,html,css,scss,json,puppet setl sw=2 sts=2 ts=2
au BufRead,BufNewFile *.jbuilder setfiletype ruby
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript

" https://vim.fandom.com/wiki/Move_to_next/previous_line_with_same_indentation
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" syntastic
let g:syntastic_mode_map = {'passive_filetypes': ['html', 'scss']}
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_exec = '/usr/local/var/rbenv/versions/2.3.0/bin/rubocop'

" yank to clipboard
" see http://www.markcampbell.me/2016/04/12/setting-up-yank-to-clipboard-on-a-mac-with-vim.html
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Line 80 marker
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

" JSdoc for vim-javascript
let g:javascript_plugin_jsdoc = 1


" Copy current filepath to clipboard
command! CopyPath let @+ = expand('%:p')

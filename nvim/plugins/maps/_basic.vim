" nerdTree
map <C-n> :NERDTreeToggle<CR>
map <C-h> :NERDTreeFind<CR>

"fzf
map <C-p> :Files<CR>
" map <C-l> :buffers<CR> map <C-o> :Tags<CR>

"To add comments
map ,c :Commentary<CR>

" Search all occurrences (AG)
nnoremap <silent> ,ag :Ag <C-R><C-W><CR>

"Easymotion"
" nmap S <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-f2)

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" multi cursor
let g:multi_cursor_use_default_mapping=0

"let g:multi_cursor_next_key='<C-]>'
"let g:multi_cursor_prev_key='<C-[>'
"let g:multi_cursor_skip_key='<C-s>'
"let g:multi_cursor_quit_key='<Esc>'
"let g:multi_cursor_start_key='<C-|>'

" neomake
nmap ,nw :lopen<CR> " open location

vnoremap <Leader>2 :TREPLSendSelection
nnoremap <Leader>2 :TREPLSendLine

vmap ,f  <Plug>(coc-format-selected)
nmap ,f  <Plug>(coc-format-selected)

nnoremap <silent> ,d :call CocAction('doHover')<CR>
nmap ,do <Plug>(coc-codeaction)
nmap ,ds <Plug>(coc-codeaction-selected)
nmap ,dr <Plug>(coc-rename)

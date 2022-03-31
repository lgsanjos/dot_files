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
" nmap S <Plug>(easymotion-overwin-f2)

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

" vmap ,f  <Plug>(coc-format-selected)
" nmap ,f  <Plug>(coc-format-selected)

" nnoremap <silent> ,d :call CocAction('doHover')<CR>
" nmap ,do <Plug>(coc-codeaction)
" nmap ,ds <Plug>(coc-codeaction-selected)
" nmap ,dr <Plug>(coc-rename)

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

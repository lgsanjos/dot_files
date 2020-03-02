set hidden         " if not set, TextEdit might fail
set nobackup       " some lang servers have issues with backups, should be default, set just in case
set shortmess+=c
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" always show signcolumns
set signcolumn=yes

let g:coc_node_path = '/Users/sanjos/.nvm/versions/node/v9.5.0/bin/node'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>

let error_symbol      = '!'
let warning_symbol    = 'w'
let info_symbol       = 'i'

" General configuration
let g:coc_global_extensions =
\ [ 'coc-json'
\ , 'coc-git'
\ , 'coc-lists'
\ , 'coc-pairs'
\ , 'coc-tsserver'
\ , 'coc-tslint-plugin'
\ , 'coc-vimlsp'
\ , 'coc-python'
\ , 'coc-emoji'
\ , 'coc-yaml'
\ , 'coc-solargraph'
\ , 'coc-python'
\ ]

let g:coc_user_config =
\  { 'coc.preferences':
\     { 'formatOnSaveFiletypes': []
\     , 'jumpCommand'          : 'split'
\     }
\ , 'codeLens':
\     { 'enable': v:true
\     }
\ , 'diagnostic':
\     { 'virtualText'        : v:true
\     , 'refreshOnInsertMode': v:true
\     , 'errorSign'          : error_symbol
\     , 'warningSign'        : warning_symbol
\     , 'infoSign'           : info_symbol
\     , 'hintSign'           : info_symbol
\     }
\ , 'list':
\     { 'indicator'         : '->>'
\     , 'selectedSignText'  : '>'
\     , 'extendedSearchMode': v:true
\     , 'normalMappings'    : {}
\     , 'insertMappings'    :
\         { '<CR>' : '<C-o>'
\         }
\     }
\ , 'suggest':
\     { 'enablePreview'           : v:true
\     , 'detailField'             : 'menu'
\     }
\ , 'languageserver':
\   {
\     "sorbet": {
\       "command": "srb",
\       "args": ["tc", "--lsp", "--enable-all-experimental-lsp-features"],
\       "filetypes": ["ruby"],
\       "rootPatterns": ["sorbet/config"],
\       "initializationOptions": {},
\       "settings": {}
\     },
\     "ccls": {
\       "command": "ccls",
\       "filetypes": ["c", "cpp", "objc", "objcpp"],
\       "rootPatterns": [".ccls", "compile_commands.json", ".git/"],
\       "initializationOptions": {}
\     },
\     'bash': {
\           'command'         : 'bash-language-server'
\         , 'args'            : ['start']
\         , 'filetypes'       : ['sh']
\         , 'ignoredRootPaths': ['~']
\     }
\   }
\ , 'git':
\     { 'changedSign.text'         : '~'
\     , 'addedSign.text'           : '+'
\     , 'removedSign.text'         : '-'
\     , 'topRemovedSign.text'      : '‾'
\     , 'changeRemovedSign.text'   : 'x'
\     , 'addedSign.hlGroup'        : 'GitGutterAdd'
\     , 'changedSign.hlGroup'      : 'GitGutterChange'
\     , 'removedSign.hlGroup'      : 'GitGutterDelete'
\     , 'topRemovedSign.hlGroup'   : 'GitGutterDelete'
\     , 'changeRemovedSign.hlGroup': 'GitGutterChangeDelete'
\     }
\ }

let g:coc_status_error_sign   = error_symbol
let g:coc_status_warning_sign = warning_symbol
let g:markdown_fenced_languages = ['vim', 'help']

" Coc Keybindings
nmap <silent> <leader>le <Plug>(coc-diagnostic-info)
nmap <silent>         [c <Plug>(coc-diagnostic-prev)
nmap <silent>         ]c <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent>         gd :call CocAction('jumpDefinition', 'edit')<CR>
"<Plug>(coc-declaration)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent>         gi :call CocAction('jumpImplementation', 'edit')<CR>
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent>         gy :call CocAction('jumpTypeDefinition', 'edit')<CR>
nmap <silent> <leader>gr <Plug>(coc-references)
vmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>lF <Plug>(coc-format)
nmap <silent> <leader>lr <Plug>(coc-rename)
nmap <silent> <leader>la <Plug>(coc-codeaction)
nmap <silent> <leader>lc <Plug>(coc-codelens-action)
nmap <silent> <leader>lq <Plug>(coc-fix-current)
nmap <silent> <leader>K  :call CocAction('doHover')<CR>
nmap <silent> <leader>ls :Denite coc-symbols<CR>
nmap <silent> <leader>lS :Denite coc-workspace<CR>
nmap <silent> <leader>lE :Denite coc-diagnostic<CR>
" use tab to navigate completion menu and jump in snippets
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>gs <Plug>(coc-git-chunkinfo)

augroup coc_autocomands
  au!
  " Setup formatexpr specified filetypes (default binding is gq)
  au FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Highlight symbol under cursor on CursorHold
  au CursorHold * silent call CocActionAsync('highlight')
  " Update signature help on jump placeholder
  " TODO: understand what this does
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Close preview window when completion is done
  au CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

" Make highlights fit in with colorscheme
hi link CocErrorSign NeomakeErrorSign
hi link CocWarningSign NeomakeWarningSign
hi link CocInfoSign NeomakeInfoSign
hi link CocHintSign NeomakeMessagesSign
hi link CocErrorHighlight SpellBad
hi link CocWarningHighlight SpellLocal
hi link CocInfoHighlight CocUnderline
hi link CocHintHighlight SpellRare
hi link CocHighlightText SpellCap
hi link CocCodeLens Comment



" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

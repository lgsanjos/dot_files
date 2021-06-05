" NeoMake

function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

let g:neomake_open_list = 2


" Snipets
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

"let g:UltiSnipsSnippetsDir = "/Users/sanjos/dotfiles/nvim/snips"
"let g:UltiSnipsSnippetDirectories=["/Users/sanjos/dotfiles/nvim/snips", "UltiSnips"]
let g:UltiSnipsEditSplit= "context"

let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --ignore-dir=public/assets --ignore-dir=vendor --ignore-dir=sorbet'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Easymotion
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.class,*.jpg,*/.git/*

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.sass-cache$|\.hg$\|\.svn$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }

"let g:ctrlp_show_hidden = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
 set grepprg=ag\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=.git\ --ignore-dir=public/assets\
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor --depth 100 -S -g "" --ignore-dir=sorbet/ --ignore-dir=tmp --ignore-dir=.git --ignore-dir=public/assets'
endif

" NerdTree

function! NERDTreeHighlightFile(extension, fg, bg, mod)
  exec 'autocmd filetype nerdtree syn match ' . a:extension . ' #^\s\+.*' . a:extension . '\*\?$#'
  exec 'autocmd filetype nerdtree highlight ' . a:extension . ' ctermbg=' . a:bg . ' ctermfg=' . a:fg . ' cterm=' . a:mod
endfunction


call NERDTreeHighlightFile('css',         '13',   'NONE',  'NONE')
call NERDTreeHighlightFile('feature',     '41',   'NONE',  'NONE')
call NERDTreeHighlightFile('gradle',      '222',  'NONE',  'NONE')
call NERDTreeHighlightFile('groovy',      '131',  'NONE',  'NONE')
call NERDTreeHighlightFile('html',        '215',  'NONE',  'NONE')
call NERDTreeHighlightFile('java',        '132',  'NONE',  'NONE')
call NERDTreeHighlightFile('js',          '201',  'NONE',  'NONE')
call NERDTreeHighlightFile('json',        '191',  'NONE',  'NONE')
call NERDTreeHighlightFile('md',          '184',  'NONE',  'NONE')
call NERDTreeHighlightFile('properties',  '229',  'NONE',  'NONE')
call NERDTreeHighlightFile('rb',          '197',  'NONE',  'NONE')
call NERDTreeHighlightFile('sh',          '208',  'NONE',  'NONE')
call NERDTreeHighlightFile('vim',         '255',  'NONE',  'NONE')
call NERDTreeHighlightFile('xml',         '210',  'NONE',  'NONE')
call NERDTreeHighlightFile('yaml',        '229',  'NONE',  'NONE')
call NERDTreeHighlightFile('yml',         '229',  'NONE',  'NONE')

let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 40
let NERDTreeMinimalUI = 1
let NERDTreeCascadeOpenSingleChildDir = 1

" YouCompleteMe"
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':f'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme = 'gruvbox'

" Gitgutter 
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

set statusline+=%{GitStatus()}

" FZF
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" SmartGF

"Key for running smartpaigf with all filters (ft/comments/def)
"default is 'gf'
let g:smartgf_key = 'gf'

"Key for running smartpaigf without filters
"default is 'gF'
let g:smartgf_no_filter_key = 'gF'

" apply the default mappings (activated by default):
let g:smartgf_create_default_mappings = 1

"Enable search with ruby gems from Gemfile
"default is 1
let g:smartgf_enable_gems_search = 1

"Enable auto-refreshing ctags file on window focus (works only with GUI)
"default is 1
let g:smartgf_auto_refresh_ctags = 1

"Max entries count to display (search results dialog)
"default is 9
let g:smartgf_max_entries_per_page = 9

"Min space between text and file path in the search results list
"default is 5
let g:smartgf_divider_width = 5

"Extensions to try for filenames which leave it off (will be tried in order)
" Default is as below
let g:smartgf_extensions = ['.ls', '.coffee', '.js']

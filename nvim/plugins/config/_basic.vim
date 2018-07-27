" Snipets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

let g:UltiSnipsSnippetsDir = "/Users/sanjos/dotfiles/nvim/snips"
let g:UltiSnipsSnippetDirectories=["/Users/sanjos/dotfiles/nvim/snips", "UltiSnips"]
let g:UltiSnipsEditSplit= "context"

let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --ignore-dir=public/assets --ignore-dir=vendor'

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
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor --depth 100 -S -g "" --ignore-dir=tmp --ignore-dir=.git --ignore-dir=public/assets'
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
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':f'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme = 'tender'

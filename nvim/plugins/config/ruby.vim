let g:flog_enable=0

let test#ruby#rspec#options = {
  \ 'nearest': '',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}

function! SplitStrategy(cmd)
  "vsp | e 999 | call termopen(a:cmd)
  vert botright new | call termopen(a:cmd)
endfunction
let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}

let test#ruby#rspec#executable = 'time bundle exec rspec'

if executable('spring')
  let test#ruby#rspec#executable = 'time spring rspec'
endif

let g:test#strategy = 'terminal_split'

let g:test#preserve_screen = 1

" vertical split instead of the default horizontal
let g:neoterm_default_mod = 'vertical'

let g:flog_enable=0

let test#ruby#rspec#options = {
  \ 'nearest': '--backtrace',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}

function! SplitStrategy(cmd)
  vsp | e 999 | call termopen(a:cmd)
endfunction
let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}

let test#ruby#rspec#executable = 'time bundle exec rspec'

let g:test#preserve_screen = 1
let g:test#strategy = 'terminal_split'

" let g:neomake_javascript_enabled_makers = ['eslint']


let test#javascript#jest#executable = 'yarn test'
let test#javascript#runner = 'jest'

" ESLint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

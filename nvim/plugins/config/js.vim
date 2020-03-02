let g:neomake_javascript_enabled_makers = ['eslint']

" ESLint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1

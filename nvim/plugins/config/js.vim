let g:neomake_javascript_enabled_makers = ['eslint']

" ESLint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

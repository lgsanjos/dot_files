" Run specs
nmap ,r :TestNearest<CR>
nmap ,a :TestFile<CR>
nmap ,e :TestLast<CR>
nmap ,tr :call RunRspecForRubyFile()<CR>

" Switch to test files
nmap ,tt :call SwitchRspecOrRuby('', '')<CR>
nmap ,ts :call SwitchRspecOrRuby(":vsp \| ", '')<CR>
nmap ,cr :call CreateRspecFromCurrentFile()<CR>

" ecomba/vim-ruby-refactoring
nnoremap ,rap  :RAddParameter<cr>
nnoremap .rrcpc :RConvertPostConditional<cr>
nnoremap ,rel  :RExtractLet<cr>
vnoremap ,rec  :RExtractConstant<cr>
vnoremap ,relv :RExtractLocalVariable<cr>
nnoremap ,rit  :RInlineTemp<cr>
vnoremap ,rrlv :RRenameLocalVariable<cr>
vnoremap ,rriv :RRenameInstanceVariable<cr>
vnoremap ,rem  :RExtractMethod<cr>

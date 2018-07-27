" Run specs
nmap ,r :TestNearest<CR>
nmap ,a :TestFile<CR>
nmap ,e :TestLast<CR>
nmap ,tr :call RunRspecForRubyFile()<CR>

" Switch to test files
nmap ,tt :call SwitchRspecOrRuby('', '')<CR>
nmap ,ts :call SwitchRspecOrRuby(":vsp \| ", '')<CR>
nmap ,cr :call CreateRspecFromCurrentFile()<CR>

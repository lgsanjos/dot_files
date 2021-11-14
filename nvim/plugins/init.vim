call plug#begin('~/.nvim/plugged')
  for f in split(glob('~/dotfiles/nvim/plugins/installers/*'), '\n')
    exe 'source' f
  endfor
call plug#end()

for f in split(glob('~/dotfiles/nvim/plugins/config/*.vim'), '\n')
  exe 'source' f
endfor

for f in split(glob('~/dotfiles/nvim/plugins/maps/*'), '\n')
  exe 'source' f
endfor

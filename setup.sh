set -x

# ln -s ~/dotfiles/config/nvim/nvchad/custom ~/.config/nvim/lua/custom
mv ~/.config/nvim ~/.config/nvim_bkp
ln -s ~/dotfiles/nvim/astrovim ~/.config/nvim
ln -s ~/dotfiles/config/wezterm ~/.config/
ln -s ~/dotfiles/config/helix ~/.config/

npm install -g spaceship-zsh-theme

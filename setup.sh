set -x

# ln -s ~/dotfiles/config/nvim/nvchad/custom ~/.config/nvim/lua/custom
mv ~/.config/nvim ~/.config/nvim_bkp
ln -s ~/dotfiles/astrovim ~/.config/nvim/lua
ln -s ~/dotfiles/config/wezterm ~/.config/
ln -s ~/dotfiles/config/helix ~/.config/
ln -s ~/dotfiles/alacritty.toml ~/.alacritty.toml

npm install -g spaceship-zsh-theme

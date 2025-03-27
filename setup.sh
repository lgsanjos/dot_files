set -x

# ln -s ~/dotfiles/config/nvim/nvchad/custom ~/.config/nvim/lua/custom
mv ~/.config/nvim ~/.config/nvim_bkp
ln -s ~/dotfiles/nvim2024 ~/.config/nvim
# ln -s ~/dotfiles/astrovim ~/.config/nvim/lua
ln -s ~/dotfiles/config/wezterm ~/.config/
ln -s ~/dotfiles/config/helix ~/.config/
ln -s ~/dotfiles/alacritty.toml ~/.alacritty.toml

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

npm install -g spaceship-zsh-theme

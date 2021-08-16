" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sharkdp/bat' " (preview)
Plug 'sharkdp/fd' " (finder)
Plug 'BurntSushi/ripgrep' " (finder)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'


" Syntex highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Snipets
"Plug 'SirVer/ultisnips'
"Plug 'kana/vim-textobj-user'

" ulti snipets
Plug 'honza/vim-snippets'

" Color theme
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mhartington/oceanic-next'

" Autocomplete
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Refactoring
" Plug 'terryma/vim-multiple-cursors'

" Search and replace multi files
" Plug 'wincent/ferret'

" Identation mark
Plug 'Yggdroot/indentLine'

" Navigation in file
Plug 'easymotion/vim-easymotion'

" neovim spec runner
Plug 'https://github.com/kassio/neoterm.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'janko-m/vim-test'

" File Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File navigation - gf
" Plug 'gorkunov/smartgf.vim'

" UI Theme Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Plug 'jacoborus/tender'

" UI header
Plug 'bling/vim-airline'

" UI show git status
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Metrics
" Plug 'git://github.com/wakatime/vim-wakatime.git'

" Might not be using
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-fugitive.git'

" CTags navigation
" Plug 'tpope/vim-unimpaired'

" Very likely to not be using
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Close parenthesis
Plug 'Raimondi/delimitMate', { 'on': [] } " TBR

" Denite.nvim
" Plug 'Shougo/denite.nvim'

" coc - Language server
" Plug 'Shougo/neoinclude.vim'
" Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" Plug 'ryanoasis/vim-devicons'

" Plug 'codota/tabnine-vim'

Plug 'yuttie/comfortable-motion.vim'

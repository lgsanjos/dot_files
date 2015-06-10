set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tomasr/molokai'
Bundle 'VimClojure'
Plugin 'tacahiroy/ctrlp-funky'

call vundle#end()

filetype on
" let g:molokai_original = 1

" ctrp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" nerdTree
map <C-n> :NERDTreeToggle<CR>


colorscheme molokai
set background=dark
set t_Co=256
hi Search ctermbg=LightBlue
set showcmd 
set encoding=utf-8
set autoindent
set foldenable
set incsearch
set ignorecase
set cursorline
set tabstop=2 shiftwidth=2 
set showmode
set number
set showmatch
set hlsearch
nnoremap <CR> :noh<CR><CR>
syntax on

"funky search 
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" Clojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1

" Maps
nmap    <F2> :set spell spelllang=en_us
nmap    <F3> :set spell spelllang=pt
noremap <Up> gk
noremap <Down> gj

" Display word count
let g:word_count="<unknown>"
function WordCount()
	return g:word_count
	endfunction
	function UpdateWordCount()
		let lnum = 1
			let n = 0
				while lnum <= line('$')
						let n = n + len(split(getline(lnum)))
								let lnum = lnum + 1
									endwhile
										let g:word_count = n
										endfunction
										" Update the count when cursor is idle in command or insert mode.
										" Update when idle for 1000 msec (default is 4000 msec).
										set updatetime=1000
										augroup WordCounter
											au! CursorHold,CursorHoldI * call UpdateWordCount()
											augroup END
											" Set statusline, shown here a piece at a time
											highlight User1 ctermbg=black  guibg=green ctermfg=grey guifg=black
											set statusline=%1*			" Switch to User1 color highlight
											set statusline+=%<%F			" file name, cut if needed at start
											set statusline+=%M			" modified flag
											set statusline+=%y			" file type
											set statusline+=%=			" separator from left to right justified
											set statusline+=\ %{WordCount()}\ words,
											set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

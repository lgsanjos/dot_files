ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

function show_versions {
	if [ -e package.json ]; then
		node_version
	elif [ -e Gemfile ]; then
		ruby_version
	else
		node_version
		echo -n ", "
		ruby_version
	fi
}

function node_version {
	NODE_VERSION_STR="node: %{$fg[cyan]%}`node -v`%{$reset_color%}"
	PROJECT_NODE_VERSION_STR=""
	if [ -e package.json ]; then
		PROJECT_NODE_VERSION_STR=", package.json: %{$fg[cyan]%}`cat package.json | jsawk 'if (this.engines) return this.engines.node; else return null'`%{$reset_color%}"
	fi

	echo -n $NODE_VERSION_STR$PROJECT_NODE_VERSION_STR
}

function ruby_version {
	RUBY_VERSION_STR="ruby: %{$fg[cyan]%}`ruby -v | grep -oh '\s[0-9.]*' | head -1 | xargs`%{$reset_color%}"
	PROJECT_RUBY_VERSION_STR=""
	if [ -e Gemfile ]; then
		PROJECT_RUBY_VERSION_STR=", Gemfile: %{$fg[cyan]%}`cat Gemfile | grep -o '\s\"[0-9.]*\"' | xargs`%{$reset_color%}"
	fi

	echo -n $RUBY_VERSION_STR$PROJECT_RUBY_VERSION_STR
}

PROMPT='%(?, ,%{$fg[red]%}FAIL%{$reset_color%}
)
%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info) ($(show_versions))
%_ $(prompt_char) '

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

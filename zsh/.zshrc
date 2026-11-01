typeset -U path
path=("$HOME/.opencode/bin" "$HOME/.local/bin" "$HOME/bin" $path)
export PATH
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=google-chrome

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=robbyrussell
plugins=(git zsh-autosuggestions)
(( $+commands[fzf] )) && plugins+=(fzf)
(( $+commands[starship] )) && ZSH_THEME=""
source "$ZSH/oh-my-zsh.sh"

HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS AUTO_CD CORRECT

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
KEYTIMEOUT=1

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --preview "bat --style=numbers --color=always {} 2>/dev/null"'

if (( $+commands[zoxide] )); then
    eval "$(zoxide init --cmd cd zsh)"
fi

if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi

alias cat=bat 
alias find=fd 
alias grep=rg
#python
alias ui='uv init'
alias ua='uv add'
alias uvv='uv venv'
alias uva='source .venv/bin/activate'

#git
alias gi='git init'

#misc-qol
alias ldr='lazydocker'
alias rv='rocm-smi'
alias nv='nvidia-smi'
alias zshconfig='nvim ~/.zshrc'
alias hfd='uvx huggingface-cli download'
alias code='flatpak run com.visualstudio.code'
alias amu='~/.local/bin/amtui'


if [[ -f "$ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" ]]; then
    source "$ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
fi

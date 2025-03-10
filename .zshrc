echo "# Welcome to Oddur's Shell Config " | gum format

autoload -U compinit; compinit

# Prevents duplicate commands from being stored in the command history.
setopt HIST_IGNORE_ALL_DUPS

# Devbox
DEVBOX_NO_PROMPT=true
eval "$(devbox global shellenv --init-hook)"

# Add autocompletions
source <(kubectl completion zsh)
source <(devbox completion zsh)
source <(docker completion zsh)
source <(kubectl completion zsh)
source <(istioctl completion zsh)
source <(stern --completion=zsh)
source ~/google-cloud-sdk/*.zsh.inc

# atuin for command history
eval "$(atuin init zsh)"

# load the environment variables
source ~/.set_env_vars.sh

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
autoload -U compinit; compinit

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export XDG_CONFIG_HOME=$HOME/.config

eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy search
source <(fzf --zsh)

# use zoxide instead of cd
eval "$(zoxide init zsh)"
alias cd="z"

# initialize direnv
eval "$(direnv hook zsh)"


# kubecolor
#compdef kubecolor=kubectl

eval $(thefuck --alias)

# Taken from https://junegunn.github.io/fzf/tips/ripgrep-integration/
# ripgrep->fzf->vim [QUERY]
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            vim {1} +{2}     # No selection. Open the current line in Vim.
          else
            vim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)


source ~/fzf-git.sh

# ---- Eza (better ls) -----

alias ls='eza --all --icons=always  --no-permissions --no-filesize --no-user --no-time --git'
alias ll='eza --long  --header --all --icons=always  --git --no-user --no-permissions'
alias lst='eza --long --all --no-permissions --no-filesize --no-user --git --sort modified'
alias fzfp='fzf --preview \"bat --style numbers --color always {}\"'
alias cat='bat --paging never --theme DarkNeon --style plain'
alias kubectl='kubecolor'
alias v="nvim"
alias k="kubectl"
alias g="git"

# setup terraform plugin cache to speed things up
mkdir -p $HOME/.terraform.d/plugin-cache
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oddurmagnusson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oddurmagnusson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oddurmagnusson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oddurmagnusson/google-cloud-sdk/completion.zsh.inc'; fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh


autoload -U compinit; compinit

# Prevents duplicate commands from being stored in the command history.
setopt HIST_IGNORE_ALL_DUPS

# Devbox — cached shellenv to avoid per-shell network calls + nix eval cost.
export DEVBOX_NO_PROMPT=true
export DO_NOT_TRACK=1              # disable devbox telemetry (segment.io)
export DEVBOX_USE_VERSION=0.17.5  # pin launcher -> skip releases.jetify.com version check
_devbox_global="$HOME/.local/share/devbox/global/default"
_devbox_cache="${XDG_CACHE_HOME:-$HOME/.cache}/devbox-global-shellenv.zsh"
if [[ ! -s "$_devbox_cache" \
   || "$_devbox_global/devbox.json" -nt "$_devbox_cache" \
   || "$_devbox_global/devbox.lock" -nt "$_devbox_cache" ]]; then
  devbox global shellenv --init-hook > "$_devbox_cache"
fi
source "$_devbox_cache"
unset _devbox_global _devbox_cache

# Add autocompletions
source <(kubectl completion zsh)
source <(devbox completion zsh)
source <(docker completion zsh)
source <(istioctl completion zsh)
source <(stern --completion=zsh)

# atuin for command history
eval "$(atuin init zsh)"

# load the environment variables
source ~/.set_env_vars.sh

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
autoload -U compinit; compinit

# Java — only configure if a runtime is actually installed (silences java_home error)
if _java_home="$(/usr/libexec/java_home 2>/dev/null)"; then
  export JAVA_HOME="$_java_home"
fi
unset _java_home
[ -d /opt/homebrew/opt/openjdk/bin ] && export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/Users/oddurmagnusson/.cargo/bin:$PATH"


export XDG_CONFIG_HOME=$HOME/.config

eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy search
source <(fzf --zsh)

# use zoxide instead of cd
if [[ "$CLAUDECODE" != "1" ]]; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

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

export EDITOR="nvim"


source ~/fzf-git.sh

alias ls='eza --all --icons=always  --no-permissions --no-filesize --no-user --no-time --git'
alias ll='eza --long  --header --all --icons=always  --git --no-user --no-permissions'
alias lst='eza --long --all --no-permissions --no-filesize --no-user --git --sort modified'
alias fzfp='fzf --preview \"bat --style numbers --color always {}\"'
alias cat='bat --paging never --theme DarkNeon --style plain'
alias kubectl='kubecolor'
alias v="nvim"
alias k="kubectl"
alias g="git"
alias lg="lazygit"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# setup terraform plugin cache to speed things up
mkdir -p $HOME/.terraform.d/plugin-cache
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oddurmagnusson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oddurmagnusson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oddurmagnusson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oddurmagnusson/google-cloud-sdk/completion.zsh.inc'; fi



# pnpm
export PNPM_HOME="/Users/oddurmagnusson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Added by Antigravity
export PATH="/Users/oddurmagnusson/.antigravity/antigravity/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/oddurmagnusson/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by CodeRabbit CLI installer
export PATH="/Users/oddurmagnusson/.local/bin:$PATH"
eval "$(tv init zsh)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/oddur/.lmstudio/bin"
# End of LM Studio CLI section


source /Users/oddur/.config/broot/launcher/bash/br
export PATH="$HOME/.local/bin:$PATH"

# Welcome screen — system info via fastfetch.
# Only in real interactive terminals: skips Claude Code, scripts, and piped/captured output.
if [[ -o interactive && -t 1 && "$CLAUDECODE" != "1" ]] && command -v fastfetch >/dev/null; then
  fastfetch
fi

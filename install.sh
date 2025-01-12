
# stow will be used to manage synlinks
brew install stow

brew install font-fira-code-nerd-font

# https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#install
bash -c "$(curl --fail --show-error --silent \
    --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# https://github.com/tonsky/FiraCode/wiki/Installing
brew install --cask font-fira-code

# https://www.jetify.com/devbox/docs/installing_devbox/
curl -fsSL https://get.jetify.com/devbox | bash


# git hub command line tool


## kubernetes stuff

# https://github.com/hidetatz/kubecolor
brew install kubectl
brew install kubecolor
brew install helm
brew install k9s
brew install stern
# interact with cnpg postgres db's
brew install kubectl-cnpg
brew install teller

brew install fzf
brew install ripgrep

brew install 1password-cli

brew install telnet

brew install --cask google-cloud-sdk

brew install git
brew install git-lfs
brew install git-delta
brew install lazygit
brew install github
brew install gh


## terraform stuff 

brew install terraform
brew install terramate

## Better shel setup

# https://github.com/sharkdp/bat
brew install bat
brew install glow # for showing .md files
brew install gum


brew install starship
brew install z
brew install tmux


# zsh plugins
brew install zsh-autosuggestions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting

## helper tools
brew install thefuck 
brew install tldr

# computer monitoring tools
brew install btop
brew install htop
brew install dustu

brew install neovim

brew install tailscale
brew install zellij
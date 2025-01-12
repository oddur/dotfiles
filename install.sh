# Install GNU Stow to manage symlinks for dotfiles or other configurations
brew install stow

# Install Fira Code Nerd Font for a better coding experience with ligatures
brew install font-fira-code-nerd-font

# Install Fira Code font (non-Nerd variant) for general use
# Reference: https://github.com/tonsky/FiraCode/wiki/Installing
brew install --cask font-fira-code

# Install Devbox, a tool for creating isolated development environments
# Reference: https://www.jetify.com/devbox/docs/installing_devbox/
curl -fsSL https://get.jetify.com/devbox | bash

# GitHub CLI tool for interacting with GitHub repositories from the terminal
brew install gh

## Kubernetes-related tools
# Install Kubernetes CLI (kubectl) to interact with Kubernetes clusters
brew install kubectl

# Install Kubecolor to add colorized output to kubectl commands
# Reference: https://github.com/hidetatz/kubecolor
brew install kubecolor

# Install Helm, a package manager for Kubernetes
brew install helm

# Install K9s, a terminal UI for managing Kubernetes clusters
brew install k9s

# Install Stern, a tool for tailing logs from Kubernetes pods
brew install stern

# Install kubectl plugin for interacting with CloudNativePG PostgreSQL databases
brew install kubectl-cnpg

# Install Teller, a secrets management tool for developers and DevOps teams
brew install teller

## General utilities
# Install fuzzy finder (fzf) for command-line searching and navigation
brew install fzf

# install zoxide for fast directory navigation
brew install zoxide

# Install ripgrep (rg), a fast search tool for files and directories
brew install ripgrep

# Install 1Password CLI for managing secrets securely from the terminal
brew install 1password-cli

# Install Telnet client for network troubleshooting or legacy systems access
brew install telnet

## Git-related tools
# Install Git, the distributed version control system
brew install git

# Install Git Large File Storage (LFS) extension for versioning large files
brew install git-lfs

# Install Git Delta, a syntax-highlighting pager for git diff and log outputs
brew install git-delta

# Install Lazygit, a simple terminal UI for Git commands
brew install lazygit

# Install GitHub CLI (alternative to `gh`) for interacting with GitHub repositories
brew install github

## Terraform-related tools
# Install Terraform, an infrastructure as code tool by HashiCorp
brew install terraform

# Install Terramate, a tool to manage Terraform configurations at scale
brew install terramate

## Shell enhancements and utilities
# Install Bat, a cat command replacement with syntax highlighting and Git integration
# Reference: https://github.com/sharkdp/bat
brew install bat

# Install Glow, a CLI tool to render Markdown files in the terminal beautifully
brew install glow 

# Install Gum, a tool to build rich shell scripts with UI components like prompts and menus
brew install gum

# Install Starship, a highly customizable shell prompt for any shell environment
brew install starship

# Install Tmux, a terminal multiplexer to manage multiple terminal sessions in one window or remotely 
brew install tmux

## Zsh plugins to enhance functionality and productivity in Zsh shell:
brew install zsh-autosuggestions # Suggest commands based on history or completions as you type.
brew install zsh-history-substring-search # Search through command history by substring.
brew install zsh-syntax-highlighting # Highlight syntax errors or commands in the terminal.

## Helper tools:
brew install thefuck # Corrects previous console commands automatically.
brew install tldr # Simplified man pages with practical examples.

## System monitoring tools:
brew install btop # Resource monitor with an interactive UI.
brew install htop # Advanced process viewer.
brew install dustu # Disk usage analyzer in the style of `du`.

## Developer tools:
brew install neovim # Modern Vim-based text editor.
brew install tailscale # Zero-config VPN using WireGuard.
brew install zellij # Terminal workspace manager.
brew install atuin # Enhanced shell history management.

## JSON processing:
brew install jq # Lightweight and flexible command-line JSON processor.

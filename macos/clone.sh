#!/bin/sh

echo "Cloning repositories..."

# zsh plugins
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/autoupdate
git clone --recurse-submodules https://github.com/voronkovich/gitingore.plugin.zsh ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/gitingore
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting

# zsh themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes/powerlevel10k
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes/iTerm2-Color-Schemes

#!/bin/bash
#
# Install oh-my-zsh and plugins

source scripts/setup.sh

print_info "Setting up oh-my-zsh..."

###############################################################################
# oh-my-zsh                                                                   #
###############################################################################

# Check for Oh My Zsh and install if we don't have it
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" > /dev/null 2>&1
    print_result $? 'Install oh-my-zsh'
fi

###############################################################################
# plugins                                                                     #
###############################################################################

plugins=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins

declare -A plugin_repos=(
    ["autoupdate"]="https://github.com/TamCore/autoupdate-oh-my-zsh-plugins"
    ["gitingore"]="https://github.com/voronkovich/gitignore.plugin.zsh"
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["zsh-completions"]="https://github.com/zsh-users/zsh-completions"
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
)

for repo in "${!plugin_repos[@]}"; do
    git -C "${plugins}/${repo}" pull > /dev/null 2>&1 || git clone --recurse-submodules "${plugin_repos[$repo]}" "${plugins}/${repo}" > /dev/null 2>&1
    print_result $? "Clone $repo";
done

###############################################################################
# themes                                                                      #
###############################################################################

themes=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes

declare -A theme_repos=(
    ["powerlevel10k"]="https://github.com/romkatv/powerlevel10k.git"
    ["iTerm2-Color-Schemes"]="https://github.com/mbadolato/iTerm2-Color-Schemes.git"
)

for theme in "${!theme_repos[@]}"; do
    git -C "${themes}/${theme}" pull > /dev/null 2>&1 || git clone --recurse-submodules "${theme_repos[$theme]}" "${themes}/${theme}" > /dev/null 2>&1;
    print_result $? "Clone $theme"
done

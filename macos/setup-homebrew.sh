#!/bin/sh
#
# Install xcode, homebrew and essential packages

echo "Setting up your Mac..."

###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################

if ! xcode-select --print-path > /dev/null 2>&1; then

    echo "Installing XCode Command Line Tools..."

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install > /dev/null 2>&1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path > /dev/null 2>&1; do
        sleep 5
    done

fi

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
    echo "Installing oh-my-zsh..."
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file macos/Brewfile

# Clone Github repositories
macos/clone.sh

# Remove outdated versions from the cellar
brew cleanup

#!/bin/bash
#
# Install xcode, homebrew and essential packages

source scripts/setup.sh

if [ "$(uname)" != "Darwin" ]; then
    print_error "Skipping macos setup as distro is $(uname)"
    exit
fi

print_info "Setting up your Mac..."

###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################

if ! xcode-select --print-path > /dev/null 2>&1; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install > /dev/null 2>&1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path > /dev/null 2>&1; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

fi

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Check for Homebrew and install if we don't have it
if ! type brew > /dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null 2>&1
    print_result $? 'Install Homebrew'

    # Update Homebrew recipes
    brew update

    # Install all our dependencies with bundle (See Brewfile)
    brew tap homebrew/bundle
    brew bundle --file macos/Brewfile

    print_result $? 'Install Homebrew dependencies'

    # Remove outdated versions from the cellar
    brew cleanup

fi

# Get IP Address
my-ip() {
    curl ifconfig.co/
}

###############################################################################
#
# AWS Related Functions
#
###############################################################################

# Set credentials from input
aws-input() {
    export AWS_ACCESS_KEY_ID=$1
    export AWS_SECRET_ACCESS_KEY=$2
    if [[ -n "$3" ]]
    then
        export AWS_SESSION_TOKEN=$3
    fi
}

# Unset AWS environment variables
unset-aws-env() {
    unset AWS_PROFILE
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
    export AWS_DEFAULT_REGION="eu-west-1"
}

###############################################################################
#
# Updating Git Repos Related Functions
#
###############################################################################

# Pull the latest changes for some GitHub repos
update-github-repos() {
    (
        cd "$HOME"/.vim_runtime || exit ;\
        echo "vimrc" ;\
        rm -rf sources_non_forked ;\
        git checkout . > /dev/null 2>&1 ;\
        git pull --rebase ;\
        python update_plugins.py > /dev/null 2>&1 ;\
    )
}

###############################################################################
#
# Update everything
#
###############################################################################

update-everything() {
    upgrade_oh_my_zsh_all ;\
    update-github-repos ;\
    kubectl krew update ;\
    kubectl krew upgrade ;\
    tldr --update 2>&1 ;\
    echo "pip upgrade - $(pyenv version)"
    pip_upgrade_outdated -3 > /dev/null 2>&1 ;\
    (
        for version in $(pyenv versions | grep -Ev '(system|set)'); do
            echo "pip upgrade - $version"
            pyenv shell "$version"
            pip_upgrade_outdated -3 > /dev/null 2>&1
        done
    ) ;\
    brew update ;\
    brew outdated
}

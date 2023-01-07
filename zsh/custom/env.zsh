# AWS
export AWS_PAGER=""
export AWS_DEFAULT_REGION="eu-west-1"
export AWS_SDK_LOAD_CONFIG=1

# PGP
tty=$(tty)
export GPG_TTY=$tty

# https://github.com/romkatv/powerlevel10k/issues/642#issuecomment-622962339
if [[ "$TERM" != "xterm-256color" ]]; then
    export TERM=xterm-256color
fi

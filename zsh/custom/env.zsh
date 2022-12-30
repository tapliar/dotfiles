# Terraform (M1)
# https://stackoverflow.com/questions/70007818/terraform-the-plugin-encountered-an-error-and-failed-to-respond-to-the-plugin
export GODEBUG=asyncpreemptoff=1

# AWS
export AWS_PAGER=""
export AWS_DEFAULT_REGION="eu-west-1"
export AWS_SDK_LOAD_CONFIG=1

# PGP
tty=$(tty)
export GPG_TTY=$tty

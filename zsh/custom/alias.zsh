# zsh
alias zsh='$HOMEBREW/bin/zsh'

# pyenv bug - https://github.com/pyenv/pyenv/issues/106
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Edit zshrc file
alias zshconfig='vim ~/.zshrc'

# kubectl
alias kctx='kubectx'
alias kns='kubens'
alias kdebug='kubectl run lauren-test --image=giantswarm/tiny-tools -i --tty --rm'
alias kdebug1='kubectl run lauren-test --image ant1441/net -i --tty --rm'

# ripgrep with hidden flag
alias rgh='rg --hidden'

# golang
alias go-lint='golangci-lint run'
alias go-lint-extra='golangci-lint run --disable=typecheck'
alias go-test='go test -v ./...'

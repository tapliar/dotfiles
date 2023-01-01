# Save all
save: vscode-save brew krew-save pip-save

# Install all
install: vscode-install brew-restore krew-install pip-install

# Install extensions from vscode/extensions
vscode-install:
	cat vscode/extensions | xargs -L 1 code --install-extension

# Save all current extensions to vscode/extensions
vscode-save:
	code --list-extensions > vscode/extensions

# Save snapshot of all Homebrew packages to macos/Brewfile
brew:
	brew bundle dump --force --file=macos/Brewfile
	brew bundle --force cleanup --file=macos/Brewfile

# Restore Homebrew packages
brew-restore:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew upgrade
	brew install mas
	brew bundle install --file=macos/Brewfile
	brew cleanup

# Install plugins from plugins/krew
krew-install:
	cat plugins/krew | xargs -L 1 kubectl krew install

# Save all current plugins to plugins/krew
krew-save:
	kubectl krew list > plugins/krew

# Install plugins from plugins/pip
pip-install:
	cat plugins/pip | xargs -L 1 pip install --upgrade

# Save all current plugins to plugins/pip
pip-save:
	pip freeze | cut -d "=" -f 1 > plugins/pip

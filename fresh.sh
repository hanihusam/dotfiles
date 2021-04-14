#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if [[ ! -d "$HOME/.oh-my-zsh" ]] ; then
  # https://github.com/ohmyzsh/ohmyzsh#unattended-install
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended
  
  # Remove .zshrc file to replace it with our custom zshrc
  rm $HOME/.zshrc
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew & oh-my-zsh PATH by installing zshrc
./install

# Update Homebrew recipes
echo "Updating Homebrew recipes"
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing Homebrew bundle defined in Brewfile"
brew tap homebrew/bundle
brew bundle

# Install Volta separately
if test ! $(which volta); then
  curl https://get.volta.sh | bash
  
  # Install the latest version of NodeJS and Yarn using Volta
  volta install node
  volta install yarn
fi

echo "Checking whether SSH key for me@zainf.dev is already generated or not"
if ! grep -q me@zainf.dev ~/.ssh/id_ed25519.pub; then 
  echo "Generating a new SSH key for GitHub"
  ssh-keygen -t ed25519 -C "me@zainf.dev" -f ~/.ssh/id_ed25519
  eval "$(ssh-agent -s)"
  touch ~/.ssh/config
  echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
  ssh-add -K ~/.ssh/id_ed25519
  echo "SSH key for me@zainf.dev generated!"
else
  echo "SSH key for me@zainf.dev found!"
fi
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"

echo "Checking for existing GPG keys"
if [[ $(gpg --list-secret-keys --keyid-format LONG) ]]; then
  echo "GPG keys found!"
else
  echo "No GPG keys found, please generate one"
  gpg --full-generate-key
fi
echo "Pick a GPG key that you'd like to use"
echo "Then upload the public key to the remote repository"
echo "https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key"
echo "And tell Git about your GPG key"
echo "https://docs.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key"
gpg --list-secret-keys --keyid-format LONG

# Export secret environment variables
if [ -f "./secrets.zsh" ]; then
  source ./secrets.zsh
fi

# Set macOS preferences
# We will run this last because this will reload the shell
source ./macos.sh

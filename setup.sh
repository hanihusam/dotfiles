#!/bin/sh

echo "Setting up your Mac..."

echo ""
echo "=== Installing Zinit ==="
echo ""

if ! command -v zinit &> /dev/null
then
    echo "zinit could not be found"
fi

echo ""
echo "=== Installing Homebrew ==="
echo ""

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo ""
echo "=== Installing dotfiles through dotbot ==="
echo ""


# Add Homebrew & oh-my-zsh PATH by installing .zshrc file through dotbot
./install
if [ ! -f "$HOME/.secrets.zsh" ]; then
  echo ""
  echo "⚠️ Run ./bin/restore-secrets.zsh script to restore the secrets.zsh file from Box Sync"
  echo ""
fi

# Update Homebrew recipes
echo ""
echo "=== Updating Homebrew recipes ==="
echo ""
brew update

# Install all our dependencies with bundle (See Brewfile)
echo ""
echo "=== Installing Homebrew bundle defined in Brewfile ==="
echo ""
brew tap homebrew/bundle
brew bundle

echo ""
echo "=== Initializing SSH ==="
echo ""

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
echo ""
echo "⚠️ run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"

echo ""
echo "=== Initializing GPG ==="
echo ""

echo "Checking for existing GPG keys"
if [[ $(gpg --list-secret-keys --keyid-format LONG) ]]; then
  echo "GPG keys found!"
else
  echo "No GPG keys found, please generate one"
  gpg --full-generate-key
fi
echo ""
echo "⚠️ Pick a GPG key that you'd like to use"
echo ""
echo "Then upload the public key to the remote repository"
echo "https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key"
echo "And tell Git about your GPG key"
echo "https://docs.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key"

gpg --list-secret-keys --keyid-format LONG

echo ""
echo "=== Setting up macOS preferences ==="
echo ""

# Set macOS preferences
# We will run this last because this will reload the shell
./macos.sh

echo ""
echo "=== Performing final benchmark ==="
echo ""

# Call benchmark.zsh at the end of setup to assess the performance impact of the recent configuration
./bin/benchmark.zsh

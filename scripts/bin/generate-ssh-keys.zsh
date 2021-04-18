#!/bin/sh

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

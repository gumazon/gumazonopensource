#!/usr/bin/env sh


#!/usr/bin/env sh

# Generating a new SSH key and adding it to the ssh-agent
echo 'Creating a new SSH key, using the provided email as a label'
#  Generating public/private algorithm key pair
ssh-keygen -t ed25519 -C `git config user.email`

# enter 3 times, then ...
# copy finger print to
#   github/settings/ <SSH and GPG keys>/SSH Keys#generate ssh keys / <paste fingerprint>


echo 'Add new SSH key to ssh-agent'
# Start the ssh-agent in the background.
eval "$(ssh-agent -s)"

echo "Add the SSH private key to the ssh-agent and store the passphrase in the keychain"
# $ ssh-add --apple-use-keychain --apple-load-keychain ~/.ssh/id_ed25519
#
# Or use macOS Sierra 10.12.2 or later, you will need to modify your ~/.ssh/config file
# to automatically load keys into the ssh-agent and store passphrases in your keychain
cat<<EOF >> ~/.ssh/config

Host `git config user.email`
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519

EOF

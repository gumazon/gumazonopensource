#!/usr/bin/env sh

# Remove existing SSH key pair
# remove
#  pk='id_algorithm'
_pk='id_ed25519'
  _pkfl="${HOME}/.ssh/${_pk}"

  if [ -f "${_pkfl}" ]; then
      chmod +rwx "${_pkfl}"
      rm "${_pkfl}"

      chmod +rwx "${_pkfl}.pub"
      rm "${_pkfl}.pub"
  fi

# Remove Identity
ssh-add -d ~/.ssh/id_ed25519.pub


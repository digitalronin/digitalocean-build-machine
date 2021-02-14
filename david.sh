#!/bin/bash

# Run this script as david to set up the user account etc.

set -euo pipefail

main() {
  dotfiles
  configure_neovim
}

dotfiles() {
  cd
  git clone git@github.com:digitalronin/bin-scripts.git bin
  git clone git@github.com:digitalronin/dotfiles.git

  cd dotfiles
  script/bootstrap # TODO: run non-interactively
}

configure_neovim() {
  # Neovim
  mkdir ~/.config || true # .config may already exist
  cd ~/.config
  git clone git@github.com:digitalronin/neovim-config.git nvim
  mkdir -p nvim/tmp/backup nvim/tmp/swap nvim/tmp/undo
  # TODO: non-interactively install plugins
}

main


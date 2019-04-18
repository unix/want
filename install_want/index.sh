BIN='want () { curl -sd "$*" https://want.now.sh | bash -s --; }'
CYAN="$(tput setaf 6 2>/dev/null || echo '')"
NO="$(tput sgr0 2>/dev/null || echo '')"
LINT="$(tput smul 2>/dev/null || echo '')"
BOLD="$(tput bold 2>/dev/null || echo '')"

install_to_zsh() {
  if ! grep -Fxq "${BIN}" ~/.zshrc; then
    echo "${BIN}" >> ~/.zshrc
  fi
}

install_to_bash() {
  if ! grep -Fxq "${BIN}" ~/.bashrc; then
    echo "${BIN}" >> ~/.bashrc
  fi
}

success() {
  echo "Everything is ready, run <${CYAN}${BOLD}want${NO}> to start."
  echo ""
}

if test -s ~/.zshrc; then
  install_to_zsh
  success
  exit
fi

if test -s ~/.bashrc; then
  install_to_bash
  success
  exit
fi

echo "Unsupported systems."
echo ""

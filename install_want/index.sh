BIN='want () { curl -sd "$*" https://want.now.sh | bash -s --; }'
CYAN="$(tput setaf 6 2>/dev/null || echo '')"
NO="$(tput sgr0 2>/dev/null || echo '')"
LINT="$(tput smul 2>/dev/null || echo '')"
BOLD="$(tput bold 2>/dev/null || echo '')"

install_to_bash() {
  if ! grep -Fxq "${BIN}" ~/.bashrc; then
    echo "${BIN}" >> ~/.bashrc
  fi
  source ~/.bashrc > /dev/null 2>&1
}

success() {
  echo "Everything is ready, run <${CYAN}${BOLD}want${NO}> to start."
  echo ""
}

if [[ ! -f ~/.bashrc ]]; then
  touch ~/.bashrc
fi

if [[ -f ~/.bashrc ]]; then
  install_to_bash
  success
  exit
fi

echo "Unsupported systems."
echo ""

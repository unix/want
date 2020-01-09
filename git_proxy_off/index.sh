GRAY="$(tput setaf 7 2>/dev/null || echo '')"
NO="$(tput sgr0 2>/dev/null || echo '')"
SSH_CONFIG="${HOME}/.ssh/config"

git config --global --unset http.https://github.com.proxy
git config --global --unset http.proxy
git config --global --unset https.proxy
if [ -f "$SSH_CONFIG" ]; then
  if grep -Fxq "##want-git-proxy" "$SSH_CONFIG"; then
  sed -i '_bak' '/^##want-git-proxy/,/^##want-git-proxy-end/d' "$SSH_CONFIG" > /dev/null
  fi
fi

echo "${GRAY}> done, git proxy canceled. ssh proxy reset.${NO}"
echo ''

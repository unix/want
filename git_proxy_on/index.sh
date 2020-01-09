CYAN="$(tput setaf 6 2>/dev/null || echo '')"
GRAY="$(tput setaf 7 2>/dev/null || echo '')"
BOLD="$(tput bold 2>/dev/null || echo '')"
NO="$(tput sgr0 2>/dev/null || echo '')"
CONFIRM="\r${GRAY}> please enter 'y' or 'n' (yes/no) ${NO}"
SSH_CONFIG="${HOME}/.ssh/config"

echo -n "1) Do you want use ${BOLD}SOCKS5${NO} on proxy (default is HTTP): (${CYAN}Y${NO}/n) "
while true; do
    read -r IS_SOCKS < /dev/tty
    case $IS_SOCKS in
        "" ) IS_SOCKS="yes"; break;;
        [Yy]* ) IS_SOCKS="yes"; break;;
        [Nn]* ) IS_SOCKS="no"; break;;
        * ) echo -en "$CONFIRM";;
    esac
done

echo -n "2) Do you use Git in SSH mode (default is HTTP): (${CYAN}Y${NO}/n) "
while true; do
    read -r IS_SSH < /dev/tty
    case $IS_SSH in
        "" ) IS_SSH="yes"; break;;
        [Yy]* ) IS_SSH="yes"; break;;
        [Nn]* ) IS_SSH="no"; break;;
        * ) echo -en "$CONFIRM";;
    esac
done

echo -n "3) Input your proxy port: ${GRAY}(ctrl+c exit)${NO} "
while true; do
    read -r PORT < /dev/tty
    case $PORT in
        "" ) echo -en "\b\r3) Input your proxy port: ${GRAY}(ctrl+c exit)${NO} ";;
        * ) break;;
    esac
done

echo ''
PROXY_MODE=$(if [ "$IS_SOCKS" == "yes" ]; then echo 'socks5' ;else echo 'http'; fi)
GIT_MODE=$(if [ "$IS_SSH" == "yes" ]; then echo 'SSH' ;else echo 'HTTP/HTTPS'; fi)
URL="${PROXY_MODE}://127.0.0.1:${PORT}"

reset_git_proxy() {
  git config --global --unset http.https://github.com.proxy
  git config --global --unset http.proxy
  git config --global --unset https.proxy
}

append_to_ssh() {
  SSH_URL="ProxyCommand socat - PROXY:127.0.0.1:%h:%p,proxyport=${PORT}"
  if [ "$IS_SOCKS" == "yes" ]; then
    SSH_URL="ProxyCommand nc -v -x 127.0.0.1:${PORT} %h %p"
  fi

  if [ ! -f "$SSH_CONFIG" ]; then touch "$SSH_CONFIG"; fi
  if grep -Fxq "##want-git-proxy" "$SSH_CONFIG"; then
    sed -i '_bak' '/^##want-git-proxy/,/^##want-git-proxy-end/d' "$SSH_CONFIG" > /dev/null
  fi

  echo -e "##want-git-proxy
Host github.com
  HostName github.com
  User git
    ${SSH_URL}
##want-git-proxy-end" >> "$SSH_CONFIG"
}

reset_git_proxy
if [ "$IS_SSH" == "no" ]; then
  git config --global http.proxy "$URL"
  git config --global https.proxy "$URL"
else
  append_to_ssh
fi

echo "use Git by ${CYAN}${GIT_MODE}${NO}, and proxy to ${CYAN}${URL}${NO}. done."

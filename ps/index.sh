CYAN="$(tput setaf 6 2>/dev/null || echo '')"
NO="$(tput sgr0 2>/dev/null || echo '')"
RED="$(tput setaf 1 3>/dev/null || echo '')"
echo -n "${RED}> ${NO}${CYAN}keyword: ${NO}"
read reply < /dev/tty
ps -e -o pid,args | grep -E "${reply}" | grep -v grep

ARGS='pcpu,pmem,command,uid,pid,tty,user'

if [[ $(uname) == Darwin ]]; then
  ps c -wAo ${ARGS} -r | head -n 8
  exit 0
fi

ps c -Ao ${ARGS} --sort=-pcpu | head -n 8


echo -n "input your proxy port: (Ctrl+c exit) "
read REPLY < /dev/tty
echo -e "\b\rset http & https & ftp proxy to 127.0.0.1:$REPLY"
export http_proxy="http://127.0.0.1:$REPLY"
export https_proxy="https://127.0.0.1:$REPLY"
export ftp_proxy="http://127.0.0.1:$REPLY"
echo 'done'


PACKAGES='.npm_packages'
NPM_BIN="export PATH=\"\$PATH:\$HOME/${PACKAGES}/bin\""
NPM_LIB="export NODE_PATH=\"$NODE_PATH:$HOME/.npm_packages/lib/node_modules\""

err() {
  printf "$(tput setaf 1 2>/dev/null || echo '')$@$(tput sgr0 2>/dev/null || echo '')\n\n" >&2
  exit
}

if ! test -s ~/.bashrc; then
  err 'not found "~/.bashrc", exit.'
fi

if ! hash node 2>/dev/null; then
	err 'not found nodejs. exit.'
fi

if ! grep -Fxq "${NPM_BIN}" ~/.bashrc; then
  echo "${NPM_BIN}" >> ~/.bashrc
fi
if ! grep -Fxq "${NPM_LIB}" ~/.bashrc; then
  echo "${NPM_LIB}" >> ~/.bashrc
fi
npm config set prefix "~/${PACKAGES}"
source ~/.bashrc
npm config get prefix
echo 'ok'

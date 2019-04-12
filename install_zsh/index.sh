RED="$(tput setaf 1 3>/dev/null || echo '')"
CYAN="$(tput setaf 6 2>/dev/null || echo '')"
NO="$(tput sgr0 2>/dev/null || echo '')"

if command -v brew >/dev/null 2>&1; then
  echo "${RED}> ${NO}install zsh with brew."
  echo "${RED}> ${NO}brew update..."
  brew update
  echo "${RED}> ${NO}brew install zsh zsh-completions"
  brew install zsh zsh-completions
  exit
fi

if command -v apt >/dev/null 2>&1; then
  echo "${RED}> ${NO}install zsh with apt."
  echo "${RED}> ${NO}apt update..."
  sudo apt update
  echo "${RED}> ${NO}apt install zsh..."
  sudo apt install zsh
  exit
fi

if command -v yum >/dev/null 2>&1; then
  echo "${RED}> ${NO}install zsh with yum."
  echo "${RED}> ${NO}yum update..."
  sudo yum update
  echo "${RED}> ${NO}yum install zsh..."
  sudo yum -y install zsh
  exit
fi

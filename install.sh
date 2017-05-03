#!/bin/sh

# Installs Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew"

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

# Install git-completion
if [ ! -f scripts/.git-completion.bash ]; then
  echo "Downloading git-completion"

  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o scripts/.git-completion.bash
  chmod +x scripts/.git-completion.bash
fi

# Install pip
if test ! $(which pip3)
then
  echo "Installing pip3"
  curl -O https://bootstrap.pypa.io/get-pip.py
  sudo python3 get-pip.py
fi

exit 0
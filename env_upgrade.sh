#!/bin/bash
#
# This script is used to upgrade/update the following:
# 
# 1) Homebrew modules
# 2) python 2.x, 3.x modules using pip, pip3 respectively.
# 3) ruby gems 
#
#
# Author: andreas.grammenos@gmail.com
#
# You *should not* run this as sudo!

# check if commands are installed
check_cmd() {
  command -v $1 >/dev/null 2>&1 || \
  { echo >&2 "$1 was not found, skipping"; return 0; }
  return 1;
}

# update pip based on version
update_pip() {
  $1 install --upgrade pip;
  $1 freeze --local | grep -v '^\-e' | \
  cut -d = -f 1 | xargs -n1 $1 install -U >/dev/null;
}

# upgrade the brew packages
check_cmd "brew"
if [[ $? = 1 ]]; then
  echo "Upgrading Homebrew"
  brew upgrade >/dev/null;
fi

# upgrade pip3
check_cmd "pip3"
if [[ $? = 1 ]]; then
  echo "Upgrading pip3"
  update_pip "pip3"
fi

# upgrade pip
check_cmd "pip"
if [[ $? = 1 ]]; then
  echo "Upgrading pip"
  update_pip "pip"
fi

# upgrade ruby gems
check_cmd "gem"
if [[ $? == 1 ]]; then
  echo "Upgrading gem --system"
  gem update --system >/dev/null;
  echo "Upgrading gem modules"
  gem update --force >/dev/null;
fi

# upgrade rust using rustup
check_cmd "rustup"
if [[ $? == 1 ]]; then
    echo "Upgrading rust"
    rustup update >/dev/null;
fi


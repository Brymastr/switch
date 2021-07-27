#!/usr/bin/env bash
CONFIG_FILE=~/.bryswitch
platform=`uname -s`
profile=
aliases=
shell=
release_url="https://github.com/Brymastr/switch/releases/download/v0.6/switch"


# directory where `switch` will live
DIR=~/dev/github.com/brymastr/switch

# create the dir if it does not exist
[ ! -d $DIR ] && mkdir -p $DIR

# create the config file for `switch` if it doesn't exist
[ ! -f "$CONFIG_FILE" ] && touch "$CONFIG_FILE"

# download `switch`
cd $DIR

if command -v curl &> /dev/null
then
  curl -L -o switch $release_url
else
  wget -O switch $release_url
fi

chmod +x switch

# find which shell profile to update
if [ -f ~/.zshrc ]; then
  profile="$HOME/.zshrc"
  aliases="$HOME/.zaliases"
  shell='zsh'
elif [ -f ~/.bashrc ]; then
  profile="$HOME/.bashrc"
  aliases="$HOME/.bash_aliases"
  shell='bash'
elif [ -f ~/.bash_profile ]; then
  profile="$HOME/.bash_profile"
  aliases="$HOME/.bash_aliases"
  shell='bash'
fi

# create aliases file if it doesn't exist
[ ! -e $aliases ] && touch $aliases

function updateBashrc {
  if ! grep -q "[ -e $aliases ]" $profile; then
  cat >>$profile <<EOL

# Aliases go in their own file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

EOL
fi
}

function updateZshrc {
  if ! grep -q "source \$HOME/.zaliases" $profile; then
  cat >>$profile <<EOL

# aliases
source $HOME/.zaliases

EOL
fi
}

# update aliases with the required alias
if ! grep -Fxq "alias switch='source $DIR/switch'" $aliases; then
  echo '# brymastr/switch - `source` is required in order to change directories in a shell script' >> $aliases
  echo "alias switch='source $DIR/switch'" >> $aliases
fi

if [[ "$shell" -eq "zsh" ]]; then 
  updateZshrc
elif [[ "$shell" -eq "bash" ]]; then 
  updateBashrc
else
  echo "ERROR: Incompatible shell configuration detected."
  exit 1
fi

echo "Complete! you may need to source your $profile before using switch"
echo "  example: $ . $profile"

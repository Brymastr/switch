#!/usr/bin/env bash
CONFIG_FILE="$HOME/.bryswitch"
profile=
aliases=
shell=
release="v0.7"


# directory where `switch` repo will live
DIR=$HOME/dev/github.com/brymastr

# create the dir if it does not exist
[ ! -d $DIR ] && mkdir -p $DIR

# create the config file for `switch` if it doesn't exist
[ ! -e "$CONFIG_FILE" ] && touch "$CONFIG_FILE"

# clone `switch`
cd $DIR

# clone if doesn't already exist
[ ! -d "$DIR/switch/.git" ] && git clone git@github.com:Brymastr/switch.git

cd switch

git checkout tags/$release -b release-$release

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
alias="alias switch='source $DIR/switch/switch'"
if ! grep -Fxq "$alias" $aliases; then
  echo '# brymastr/switch - `source` is required in order to change directories in a shell script' >> $aliases
  echo "$alias" >> $aliases
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

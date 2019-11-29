#!/usr/bin/env bash
CONFIG_FILE=~/.bnswitch
platform=`uname`
profile='unknown'
aliases=~/.bash_aliases

# create the config file for `switch` if it doesn't exist
[ ! -f "$CONFIG_FILE" ] && touch ~/.bnswitch

# create ~/.bash_aliases if it doesn't exist
[ ! -d $aliases ] && touch $aliases

# directory where `switch` will live
DIR=~/dev/github.com/bailey-nelson/switch

# create the dir if it does not exist
[ ! -d $DIR ] && mkdir -p $DIR

# download `switch`
cd $DIR
curl -L -o switch https://github.com/Bailey-Nelson/switch/releases/download/v0.4/switch
# TODO: check that the downloaded file matches the signature
chmod +x switch

# find which bash profile to update
if [ -f ~/.bash_profile ]; then
  profile='.bash_profile'
elif [ -f ~/.bashrc ]; then
  profile='.bashrc'
fi

# update ~/.bash_aliases with the required alias
if ! grep -Fxq "alias switch='source $DIR/switch'" $aliases; then
  echo '# bailey-nelson/switch - `source` is required in order to change directories in a shell script' >> $aliases
  echo "alias switch='source $DIR/switch'" >> $aliases
fi

# add a reference to ~/.bash_aliases if one does not already exist
if ! grep -q "[ -f $aliases ]" ~/$profile; then
  echo $'# Aliases go in their own file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
' >> ~/$profile
fi

echo "complete! you may need to source your ~/$profile before using switch"
echo "  example: $ . ~/$profile"

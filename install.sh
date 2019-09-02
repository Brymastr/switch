#!/usr/bin/env bash
CONFIG_FILE=~/.bnswitch
[ ! -f "$CONFIG_FILE" ] && touch ~/.bnswitch

# DIR=~/dev/github.com/bailey-nelson/switch
DIR=~/dev/github.com/bailey-nelson/switch/test

[ ! -d $DIR ] && mkdir -p $DIR
cd $DIR
curl -L -o switch https://github.com/Bailey-Nelson/switch/releases/download/v0.1-alpha/switch
chmod +x switch
# platform=`uname`
# profile='unknown'
# aliases=~/.bash_aliases

# if [ -d ~/.bashrc ]; then
#   profile='.bashrc'
# elif [ -d ~/.bash_profile ]; then
#   profile='.bash_profile'
# fi

# [ ! -d ~/.bash_aliases ] && touch ~/.bash_aliases

# if ! grep -Fxq "alias switch=source $DIR" ~/.bash_aliases; then
#   echo -n '# bailey-nelson/switch - `source` is required in order to change directories in a shell script' >> ~/.bash_aliases
#   echo "alias switch=source $DIR" >> ~/.bash_aliases
# fi

# if ! grep -Fq "[ -f ~/.bash_aliases ]" $profile; then
#   echo $'
# # Aliases go in their own file
# if [ -f ~/.bash_aliases ]; then
#   . ~/.bash_aliases
# fi
# ' >> ~/$profile
# fi

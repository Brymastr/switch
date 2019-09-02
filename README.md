# switch

Easily switch directories to the desired github repository and clone if necessary.

## Installing

### wget

`wget -O - https://github.com/Bailey-Nelson/switch/releases/download/v0.2-alpha/install.sh | bash`

### curl

`curl -L https://github.com/Bailey-Nelson/switch/releases/download/v0.2-alpha/install.sh | bash`

### git

1. git clone
2. add alias to bash_aliases
3. source .bash_profile or .bashrc

## Usage

```
~$ switch looker-schema
github org: bailey-nelson
Cloning into '~/dev/github.com/bailey-nelson/looker-schema'...
...
~/dev/github.com/bailey-nelson/looker-schema$
```

On first use you will be asked for your github organization name.

## Assumptions

- `.bash_profile` is used if it exists. Otherwise `.bashrc` is used.
- A `.bash_aliases` file will be created and linked to if one does not exist

NOTE: Make sure you trust this script and that it's not editing your hosts nefariously. I can tell you it's safe but you shouldn't trust strangers on the internet.

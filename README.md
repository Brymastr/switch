# switch

Easily switch directories to the desired github repository and clone if necessary.

## Installing

### wget

`wget -O - https://github.com/Bailey-Nelson/switch/releases/download/v0.4/install.sh | bash`

### curl

`curl -L https://github.com/Bailey-Nelson/switch/releases/download/v0.4/install.sh | bash`

### git

1. git clone
2. add alias to bash_aliases
3. source .bash_profile or .bashrc

## Usage

When using switch for the first time you will be asked for a github organization name. This can also be a personal account name.

```bash
~$ switch looker-schema
github org: bailey-nelson
Cloning into '~/dev/github.com/bailey-nelson/looker-schema'...
...
switching to "looker-schema"
~/dev/github.com/bailey-nelson/looker-schema$
```

You can also set the organization name with an argument.

```bash
~$ switch --org bailey-nelson pipeline
github organization set to "bailey-nelson"
Cloning into '~/dev/github.com/bailey-nelson/pipeline'...
...
switching to "pipeline"
~/dev/github.com/bailey-nelson/pipeline$
```

## Assumptions

- `.bash_profile` is used if it exists. Otherwise `.bashrc` is used.
- A `.bash_aliases` file will be created and linked to if one does not exist

## Notes

This script sort of enforces a certain directory structure for where projects will live. If you use this script to handle cloning projects then it doesn't really matter where they go but if you're interested here's the structure:

`~/dev/github.com/<org name>/<repo name>`

I have seen this structure used in multiple companies recently.

I don't have any acceptance criteria for a version 1.0. If anyone would like to fork this and run with it they're more than welcome to.

Lastly, as always, make sure you trust this script and that it's not doing something malicious like editing your `/etc/hosts`. I can tell you it's safe but you shouldn't trust strangers on the internet.

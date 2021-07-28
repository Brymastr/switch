# switch

Easily switch directories to the desired github repository and clone if necessary.

## Install

### wget

```bash
wget -O - https://github.com/Brymastr/switch/releases/download/v0.7/install.sh | bash
```

### curl

```bash
curl -L https://github.com/Brymastr/switch/releases/download/v0.7/install.sh | bash
```

### git

1. git clone
2. add alias to bash_aliases
3. source .bash_profile or .bashrc

## Usage

When using switch for the first time you will be asked for a github organization name. This can also be a personal account name:

```bash
~$ switch aws-sdk-js
github org: aws
Cloning into '~/dev/github.com/aws/aws-sdk-js'...
...
Switching to 'aws-sdk-js'
~/dev/github.com/aws/aws-sdk-js$
```

The organization name can also be set with the `--org` option:

```bash
~$ switch --org facebook react
Cloning into '~/dev/github.com/facebook/react'...
...
Switching to 'react'
~/dev/github.com/facebook/react$
```

The above example will only use `facebook` as the organization name for that invocation. To persist the org name for future commands use the `--org-save` option:

```bash
~$ switch --org-save google flatbuffers
github organization set to 'google'
Cloning into '~/dev/github.com/google/flatbuffers'...
...
Switching to 'flatbuffers'
~/dev/github.com/google/flatbuffers$

# future invocations will use the google org without the --org option
~/dev/github.com/google/flatbuffers$ switch gson
Cloning into '~/dev/github.com/google/gson'...
...
Switching to 'gson'
~/dev/github.com/google/gson$
```

These examples all use GitHub repositories but it is also possible to clone GitLab repositories via the `--gitlab` flag:

```bash
~$ switch --gitlab --org-save fdroid fdroidclient
gitlab organization set to 'fdroid'
Cloning into '~/dev/github.com/fdroid/fdroidclient'...
...
Switching to 'fdroidclient'
~/dev/gitlab.com/fdroid/fdroidclient$
# This will persist both the org name as well as your preference for GitLab
#   meaning both --gitlab and --org can be ommitted in your next invocation
#   if you want to switch to another GitLab repo within the same org
```

## Assumptions

- `.bash_profile` is used if it exists. Otherwise `.bashrc` is used.
- A `.bash_aliases` file will be created and linked to if one does not exist

## Notes

This script plays nicely with bash and zsh.

This script sort of enforces a certain directory structure for where projects will live. If you use this script to handle cloning projects then it doesn't really matter where they go but if you're interested here's the structure:

`~/dev/github.com/<org name>/<repo name>`

I have seen this structure used in multiple companies recently.

I don't have any acceptance criteria for a version 1.0. If anyone would like to fork this and run with it they're more than welcome to.

Lastly, as always, make sure you trust this script and that it's not doing something malicious like editing your `/etc/hosts`. I can tell you it's safe but you shouldn't trust strangers on the internet.

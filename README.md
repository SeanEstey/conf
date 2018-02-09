## Local Setup

#### SSH tunnel access

Generate SSH key if not already created:

`ssh-keygen -t rsa`

Transfer pubkey to VPS:

`scp ~/.ssh/mykey.pub root@hostname:~/.ssh/`

Configure SSH alias to VPS. Open vim in ~/.ssh/config and paste:

```
Host cryptfolio
  HostName 45.79.176.125
  IdentityFile ~/.ssh/SSH_KEY_FILE
  User root
```

## Remote (VPS) Setup

#### Config vim/bash/tmux

```
cp ./{.bashrc,.vimrc,.tmux.conf} ~/
source ~/.bash_profile
vim
:so ~/.vimrc
tmux source-file ~/.tmux.conf
```

#### Config Bash & Vim

Copy .bash_profile, .bashrc, and .vimrc from /ubuntu in repository root to home (~) directory.

Execute bash config:
`source ~/.bash_profile`

#### Config System Timezone

```
apt-get update
sudo dpkg-reconfigure tzdata
```

#### Setup SSH

Open pubkey transferred from local machine in previous step and copy the key to ~/.ssh/authorized_keys

Remove password authentication for SSH:

`vim /etc/ssh/sshd_config`

Set:

`PasswordAuthentication no`

Restart SSH service:

`service ssh restart`

#### Configure Git

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

#### Setup Github SSH Access

1. Go to Github->Settings->SSH & GPG Keys->New SSH Key.
2. Paste the VPS pubkey and save.



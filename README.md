# Setup Instructions

#### Install packages

`apt-get install git tmux`

#### Setup git if not already installed

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

#### Set-up SSH access

Copy pubkey from remote machine. On remote machine terminal:

`scp ~/.ssh/mykey.pub root@hostname:~/.ssh/`

On local machine, open the transferred ~/.ssh/mykey.pub file in vim, copy key to ~/.ssh/authorized_keys

Remove password authentication for SSH:

`vim /etc/ssh/sshd_config`

Set:

`PasswordAuthentication no`

Restart SSH service:

`service ssh restart`

#### Config vim/bash/tmux

```
cp ./{.bashrc,.vimrc,.tmux.conf} ~/
source ~/.bashrc
vim
:so ~/.vimrc
tmux source-file ~/.tmux.conf
```

#### Set system time to local:

`sudo dpkg-reconfigure tzdata`

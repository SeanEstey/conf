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

Go to Github->Settings->SSH & GPG Keys->New SSH Key.
Paste the VPS pubkey and save.



## Setup MongoDB Authentication

Start mongod daemon, open mongo shell and paste:

```
use admin
db.createUser({
    user: "root",  pwd: “PASSWORD_HERE”, 
  roles: [{"role":"root", "db":"admin"}]
})
```
Copy mongod.conf to /etc

Open /etc/mongod.conf in vim and replace the IP address with the VPS IP:

```
net:
  port: 27017
  bindIp: 127.0.0.1,MY_VPS_IP_ADDRESS
```

Restart mongod with auth enabled:

`mongod --auth --port 27017 --dbpath /data/db`

Now access mongo shell with auth info:

`mongo localhost:27017 -u root -p my_auth_password --authenticationDatabase admin`

Add aliases in .bashrc:

```
alias="mongo localhost:27017 -u root -p my_auth_password --authenticationDatabase admin"
alias="mongod --auth --port 27017 --dbpath /data/dd"
```

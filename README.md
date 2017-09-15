# Setup Instructions

#### Setup git if not already installed

	`apt-get install git`
	`git config --global user.name "John Doe"`
	`git config --global user.email johndoe@example.com`

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

#### Setup .bashrc and .vimrc

	`cp ./.bashrc ~/`
	`cp ./.vimrc ~/`
	`source ~/.bashrc`
	`vim`
	`:so ~/.vimrc`

#### Set system time to local:

	`sudo dpkg-reconfigure tzdata`

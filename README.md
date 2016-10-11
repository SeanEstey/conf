Set system time to local:

sudo dpkg-reconfigure tzdata

Add all pubkeys to ~/.ssh.authorized_keys

Remove password authentication for SSH:

`$ vim /etc/ssh/sshd_config`

Set:
`PasswordAuthentication no`

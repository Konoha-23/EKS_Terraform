For setting up ssh login, the setup on ubuntu has changed. Follow this Q&A thread for new steps to set password authentication: https://serverfault.com/questions/1115174/ubuntu-22-10-not-allowing-ssh-with-a-password-worked-in-ubuntu-22-04

Option 1: Disable the inheritance within /etc/ssh/sshd_config # Include /etc/ssh/sshd_config.d/*.conf and set PasswordAuthentication yes

Option 2: cd /etc/ssh/sshd_config.d, then vi into "60-cloudimg-settings.conf" or vi into "/etc/ssh/sshd_config.d/60-cloudimg-settings.conf"
ls look for entries containing PasswordAuthentication no (this overrides any configuration entered in /etc/ssh/sshd_config) and set the value to yes. PasswordAuthentication no
I hope this helps.

Note: Do not forget to restart ssh with sudo service ssh restart

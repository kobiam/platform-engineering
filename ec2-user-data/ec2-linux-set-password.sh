#!/bin/bash
# WARN: Not intended for production

# Enable password auth on first boot
sed -i 's/#*PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/#*ChallengeResponseAuthentication .*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#*UsePAM .*/UsePAM yes/' /etc/ssh/sshd_config

# Set/reinforce password for your user
echo 'admin:yourpasswordhere123' | chpasswd

# Restart SSH
systemctl restart ssh

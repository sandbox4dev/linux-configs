swapon --show
swapon
sudo pacman -Syu
sudo pacman -S fastfetch
fastfetch
sudo fallocate -l 24G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1M count=24576 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
yay -S sublime-text-4
clear
subl /etc/fstab
free -h
cd /
l
ls
sudo swapon /swapfile
free -h
sudo blkid
lsblk
subl /etc/default/grub 
sudo filefrag -v /swapfile | grep " 0:" | awk '{print $4}'
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -S os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
clear
reboot
swapon --show
sudo swapon --show
yay -S google-chrome
swapon --show
systemctl hibernate
dracut --version
subl /etc/dracut.conf.d/resume.conf
sudo dracut --force
sudo dracut --force
dracut --force
su
df -h
clear
clear
df -h
subl fstab
blkid
lsblk
lsblk
clear
ls /boot
cd efi
ls /boot/efi/
sudo ls /boot/efi/
sudo ls -la /boot/efi/
reboot
systemctl hibernate
sudo dracut-rebuild
reboot
fastfetch
sudo pacman -S kitty
sudo pacman -S telegram-desktop
fastfetch
fastfetch
sensors
reboot
rfkill list bluetooth
sudo systemctl status bluetooth
sudo systemctl enable --now bluetooth
sudo pacman -S gnome-disk-utility
ls
subl .config//user-dirs.dirs 
reboot
ls
exit
docker ps -a
docker images
exit
sudo pacman -S loqwatch
sudo pacman -S ksystemlog
sudo pacman -S resources
sudo pacman -S bruno
yay -s bruno
sudo pacman -Syu
clear
sudo yay -S bruno
yay -S bruno
sudo pacman -S docker docker-compose
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
newgrp docker
docker ps -a
reboot
docker ps -a
sudo systemctl stop docker.service
sudo systemctl disable docker.service
clear
sudo pacman -Rns docker-compose
sudo pacman -Rns docker
cd downloads/
reboot
cd downloads/
wget https://download.docker.com/linux/static/stable/x86_64/docker-27.3.1.tgz -qO- | tar xvfz - docker/docker --strip-components=1
mv ./docker /usr/local/bin
sudo mv ./docker /usr/local/bin
sudo pacman -U ./docker-desktop-x86_64.pkg.tar.zst
docker --version
docker ps -a
systemctl --user enable docker-desktop
reboot
 gpg --generate-key
pass init 566A59756048A6EE715102C9F22DB6437573BDA2
docker ps -a
fastfetch
subl /etc/systemd/system/ryzenadj.service
sudo pacman -S ryzenadj
l
ls
cd Extra/
ls
chmod +x $HOME/Extra/bat
sudo chmod +x $HOME/Extra/bat
sudo ln -s $HOME/Extra/bat /usr/local/bin/bat
bat threshold 75
sudo bat threshold 75
sudo bat persist
sudo chmod +x $HOME/Extra/ryzenadj
sudo ln -s $HOME/Extra/ryzenadj /usr/local/bin/ryzenadj
sudo systemctl enable ryzenadj.service
systemctl status ryzenadj.service
reboot
systemctl status ryzenadj.service
exit
sudo pacman -S git
git -v
clear
sudo pacman -S zsh
chsh -s $(which zsh)
reboot

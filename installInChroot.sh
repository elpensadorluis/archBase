echo "┌──────────────────────────────────────────────┐"
echo "│ ███████╗███████╗███╗   ██╗████████╗██╗   ██╗ │"
echo "│ ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██║   ██║ │"
echo "│ ███████╗█████╗  ██╔██╗ ██║   ██║   ██║   ██║ │"
echo "│ ╚════██║██╔══╝  ██║╚██╗██║   ██║   ██║   ██║ │"
echo "│ ███████║███████╗██║ ╚████║   ██║   ╚██████╔╝ │"
echo "│ ╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝  │"
echo "└────────────────────────────────────┤.studio├─┘"
echo ""

echo damocles > /etc/hostname

ln -sf /usr/share/zoneinfo/America/Caracas /etc/localtime

hwclock -systohc

echo LANG=es_VE.UTF-8 > /etc/locale.conf

locale-gen


echo KEYMAP=la-latin1 > /etc/vconsole.conf

pacman -Sy efibootmgr dosfstools os-prober mtools grub vim

grub-install --efi-directory=/boot/efi --bootloader-id='Arch Linux' --target=x86_64-efi

grub-mkconfig -o /boot/grub/grub.cfg

passwd

useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash el

passwd el

bash <(curl -o /home/el/installInRoot.sh https://raw.githubusercontent.com/elpensadorluis/archBase/master/installInRoot.sh)

rm /installInChroot.sh

exit
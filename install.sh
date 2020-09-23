echo "┌──────────────────────────────────────────────┐"
echo "│ ███████╗███████╗███╗   ██╗████████╗██╗   ██╗ │"
echo "│ ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██║   ██║ │"
echo "│ ███████╗█████╗  ██╔██╗ ██║   ██║   ██║   ██║ │"
echo "│ ╚════██║██╔══╝  ██║╚██╗██║   ██║   ██║   ██║ │"
echo "│ ███████║███████╗██║ ╚████║   ██║   ╚██████╔╝ │"
echo "│ ╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝  │"
echo "└────────────────────────────────────┤.studio├─┘"
echo ""

# mount /dev/sda2 /mnt
# mkdir /mnt/home
# mkdir -p /mnt/boot/efi
# mount /dev/sda1 /mnt/boot/efi
# mount /dev/sda4 /mnt/home

pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager gvfs gvfs-afc gvfs-mtp xdg-user-dirs
pacstrap /mnt netctl wpa_supplicant dialog

genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt

echo damocles > /etc/hostname

ln -sf /usr/share/zoneinfo/America/Caracas /etc/localtime

echo LANG=es_VE.UTF-8 > /etc/locale.conf

locale-gen

hwclock -w

echo KEYMAP=la-latin1 > /etc/vconsole.conf

grub-install --efi-directory=/boot/efi --bootloader-id='Arch Linux' --target=x86_64-efi

grub-mkconfig -o /boot/grub/grub.cfg

passwd

useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash el

passwd el

exit

umount -R /mnt


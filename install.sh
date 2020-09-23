echo "┌──────────────────────────────────────────────┐"
echo "│ ███████╗███████╗███╗   ██╗████████╗██╗   ██╗ │"
echo "│ ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██║   ██║ │"
echo "│ ███████╗█████╗  ██╔██╗ ██║   ██║   ██║   ██║ │"
echo "│ ╚════██║██╔══╝  ██║╚██╗██║   ██║   ██║   ██║ │"
echo "│ ███████║███████╗██║ ╚████║   ██║   ╚██████╔╝ │"
echo "│ ╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝  │"
echo "└────────────────────────────────────┤.studio├─┘"
echo ""

echo "Usa la siguiente linea para instalar desde remoto"
echo "bash <(curl -s https://raw.githubusercontent.com/elpensadorluis/archBase/master/install.sh)"

timedatectl set-ntp true
timedatectl status

# mount /dev/sda2 /mnt
# mkdir /mnt/home
# mkdir -p /mnt/boot/efi
# mount /dev/sda1 /mnt/boot/efi
# mount /dev/sda4 /mnt/home

pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager gvfs gvfs-afc gvfs-mtp xdg-user-dirs
pacstrap /mnt netctl wpa_supplicant dialog

genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt

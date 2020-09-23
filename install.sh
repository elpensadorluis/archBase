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
echo "───────────────────────────────────┤.particion del disco├─"
echo "Recuerda crear las particiones en el siguiente orden: Boot,Raiz,Swap,home"
cfdisk -z /dev/sda
fdisk -l
echo "formateando particiones..."
yes | mkfs.vfat -F32 /dev/sda1
yes | mkfs.ext4 /dev/sda2
yes | mkfs.ext4 /dev/sda4
yes | mkswap /dev/sda3
swapon /dev/sda3

echo "───────────────────────────────────┤.montando particiones├─"
mount /dev/sda2 /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda4 /mnt/home

# pacstrap /mnt base base-devel linux linux-firmware efibootmgr os-prober mtools ntfs-3g networkmanager gvfs gvfs-afc gvfs-mtp xdg-user-dirs
# pacstrap /mnt netctl wpa_supplicant dialog

# genfstab -pU /mnt >> /mnt/etc/fstab

# bash <(curl -o /mnt/installInChroot.sh https://raw.githubusercontent.com/elpensadorluis/archBase/master/installInChroot.sh)

# arch-chroot /mnt

# echo "───────────────────────────────────┤.desmontando particiones├─"
# umount -R /mnt

# echo "Ahora toca reiniciar el sistema..."



echo "┌──────────────────────────────────────────────┐"
echo "│ ███████╗███████╗███╗   ██╗████████╗██╗   ██╗ │"
echo "│ ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██║   ██║ │"
echo "│ ███████╗█████╗  ██╔██╗ ██║   ██║   ██║   ██║ │"
echo "│ ╚════██║██╔══╝  ██║╚██╗██║   ██║   ██║   ██║ │"
echo "│ ███████║███████╗██║ ╚████║   ██║   ╚██████╔╝ │"
echo "│ ╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝  │"
echo "└────────────────────────────────────┤.studio├─┘"
echo ""

sudo nmcli dev wifi connect $1 password $2

git clone https://aur.archlinux.org/yay-git.git

cd yay-git

makepkg -si 

yay -S neovim-nightly

bash <(curl -s https://raw.githubusercontent.com/elpensadorluis/nvim/master/utils/install.sh)

bash <(curl -o /home/el/installGraphics.sh https://raw.githubusercontent.com/elpensadorluis/archBase/master/installGraphics.sh)

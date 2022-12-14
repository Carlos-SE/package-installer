# Package Installer and basic configuration


APT = sudo apt install
PACMAN = sudo pacman -S

all : show_help

show_help :
	@echo "Please run the command: make 'option'"
	@echo "considering these two options:"
	@echo "\tmake apt"
	@echo "\tmake pacman"

# apt installation
apt : apt_update
	@$(APT) vim
	@$(APT) curl
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@$(APT) build-essential cmake vim-nox python3-dev
	@$(APT) mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
	@wget -O ~/.vimrc https://raw.githubusercontent.com/Carlos-SE/vimrc/master/vimrc
	@vim -c "PlugInstall"
	@python3 ~/.vim/plugged/YouCompleteMe/install.py --all

apt_update :
	@sudo apt update

# pacman installation
pacman : pacman_update
	$(PACMAN) vim
	$(PACMAN) curl
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	$(PACMAN) base-devel python3 cmake python-pip
	$(PACMAN) go jdk-openjdk npm 
	@wget -O ~/.vimrc https://raw.githubusercontent.com/Carlos-SE/vimrc/master/vimrc
	@vim -c "PlugInstall"
	@python3 ~/.vim/plugged/YouCompleteMe/install.py --all

pacman_update :
	@sudo pacman -Syu

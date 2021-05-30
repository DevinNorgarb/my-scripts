
sudo apt update




 sudo apt install gdebi terminator docker docker-compose git wget curl python3 virt-viewer nmap  nginx

 wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

 sudo gdebi google-chrome-stable_current_amd64.deb -y


 ssh-keygen

 sudo snap install slack --classic


sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

wget https://release.axocdn.com/linux/GitKraken-v6.0.1.deb
mkdir tmp
dpkg-deb tmp  GitKraken-v5.0.4.deb
dpkg-deb -R GitKraken-v5.0.4.deb tmp

	mkdir tmp
	dpkg-deb -R GitKraken-v5.0.4.deb tmp
# edit DEBIAN/postinst
	dpkg-deb -b tmp fixed.deb
	sudo snap install postman


##Pythong
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.6
sudo apt install python3.7
sudo apt install python3.7


##Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 14
nvm use 14



##PHP
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt install php7.3 php7.3-common
sudo apt install php5.6 php5.6-common
sudo apt install php5.6-dom php5.6-dom-curl


sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
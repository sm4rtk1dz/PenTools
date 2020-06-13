#!/bin/bash

echo "
██████╗░███████╗███╗░░██╗████████╗░█████╗░░█████╗░██╗░░░░░░██████╗
██╔══██╗██╔════╝████╗░██║╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝
██████╔╝█████╗░░██╔██╗██║░░░██║░░░██║░░██║██║░░██║██║░░░░░╚█████╗░
██╔═══╝░██╔══╝░░██║╚████║░░░██║░░░██║░░██║██║░░██║██║░░░░░░╚═══██╗
██║░░░░░███████╗██║░╚███║░░░██║░░░╚█████╔╝╚█████╔╝███████╗██████╔╝
╚═╝░░░░░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝╚═════╝░

Penetration testing tools for Debian [by Sm4rtK1dz]
"

prompt_install() {
	while true; do
	    read -p "Do you want to install ${1}? [Y/n] " yn
	    case $yn in
		[Yy]* ) $2; break;;
	    [Nn]* ) echo "Skipping ${1}"; break;;
	    * ) echo "Please answer yes or no.";;
	    esac
	done
}

install_debian_tools() {
	sudo apt install -y php golang
	sudo apt install -y ufw net-tools strace ltrace gobuster
	sudo apt install -y steghide
	sudo apt autoremove -y
}
prompt_install "debian tools" install_debian_tools

install_git_repos() {
	git clone https://github.com/rebootuser/LinEnum.git ./LinEnum
	git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git ./PEASS
}
prompt_install "git repos" install_git_repos

install_ffuf() {
	wget -q -L github.com/ffuf/ffuf/releases/download/v1.0.2/ffuf_1.0.2_linux_amd64.tar.gz
	mkdir ffuf 
	tar -xzf ffuf_1.0.2_linux_amd64.tar.gz -C ffuf
	rm ffuf_1.0.2_linux_amd64.tar.gz
}
prompt_install "ffuf" install_ffuf

exit 1



all: setup config


setup:
	chmod +x pi-setup.sh
	./pi-setup.sh
	chmod -x pi-setup.sh


config: clean
	ln -s ${HOME}/pi_setup/bashrc ${HOME}/.bashrc
	ln -s ${HOME}/pi_setup/inputrc ${HOME}/.inputrc
	# source ${HOME}/.bashrc
	# bind -f ${HOME}/.inputrc


clean:
	rm -rf ${HOME}/.bashrc
	rm -rf ${HOME}/.inputrc

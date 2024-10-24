#!/bin/bash

bash <(curl -s https://raw.githubusercontent.com/algj/uml-setup/main/download_kernel.sh)
cd ./linux-*

rm .config
wget https://raw.githubusercontent.com/algj/uml-setup/main/.config

bash <(curl -s https://raw.githubusercontent.com/algj/uml-setup/main/setup_kernel.sh)
cp ./linux ../linux
cp ./vmlinux ../vmlinux
rm -rf linux-*

bash <(curl -s https://raw.githubusercontent.com/algj/uml-setup/main/makevm.sh)

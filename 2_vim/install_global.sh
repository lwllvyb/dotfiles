#!/bin/bash

# linux
wget http://tamacom.com/global/global-6.6.3.tar.gz
tar zxf global-6.6.3.tar.gz
cd global-6.6.3
sh ./reconf.sh
./configure CC='gcc -std=gnu99'
make
sudo make install

# macos
brew install global

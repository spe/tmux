#!/bin/bash

# this is the script for installation of tmux.
# new tmux version is based on libevent and ncurses packages.
# install libevent and ncurses first.

set -e

TMP_DIR=$HOME/tmp_tmux
mkdir $TMP_DIR
cd $TMP_DIR

#==================
# install libevent
#==================
git clone https://github.com/libevent/libevent.git
cd libevent
./configure --prefix=$HOME/bin --disable-shared
make
make install
cd $TMP_DIR

#==================
# install ncurses
#==================
wget http://invisible-island.net/datafiles/release/ncurses.tar.gz
tar zxvf ncurses.tar.gz
cd ncurses
./configure --prefix=$HOME/bin
make
make install
cd $TMP_DIR

#==================
# install tmux
#==================
wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
tar zxvf tmux-2.1.tar.gz
cd tmux
./configure --prefix=$HOME/bin CFLAGS="-I$HOME/bin/include -I$HOME/bin/include/ncurses" LDFLAGS="-L$HOME/bin/lib -L$HOME/bin/include/ncurses -L$HOME/bin/include"CPPFLAGS="-I$HOME/bin/include -I$HOME/bin/include/ncurses" LDFLAGS="-static -L$HOME/bin/include -L$HOME/bin/include/ncurses -L$HOME/bin/lib"
make
make install
cd $TMP_DIR


# clean up
rm -rf ~/tmp_tmux

echo "tmux is ready for use. Add $HOME/bin into your $PATH"
echo "tmux -V is to check the version you are using."

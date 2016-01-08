#!/bin/bash

# this is the script for installation of tmux.

# On ubuntu, there are some tools have to install first.
# 1. sudo apt-get install automake
# 2. sudo apt-get install libtool

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
sh autogen.sh
./configure --prefix=$HOME/bin --disable-shared
make
make install
cd $TMP_DIR

#==================
# install ncurses
#==================
wget http://invisible-island.net/datafiles/release/ncurses.tar.gz
tar zxvf ncurses.tar.gz
NCURSES_VER=`find . -maxdepth 1 -type d  | grep ncurses | cut -b 3-`
cd $NCURSES_VER
./configure --prefix=$HOME/bin
make
make install
cd $TMP_DIR

#==================
# install tmux
#==================
wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
tar zxvf tmux-2.1.tar.gz
TMUX_VER=`find . -maxdepth 1 -type d  | grep tmux | cut -b 3-`
cd $TMUX_VER
./configure --prefix=$HOME/bin CFLAGS="-I$HOME/bin/include -I$HOME/bin/include/ncurses" LDFLAGS="-L$HOME/bin/lib -L$HOME/bin/include/ncurses -L$HOME/bin/include"CPPFLAGS="-I$HOME/bin/include -I$HOME/bin/include/ncurses" LDFLAGS="-static -L$HOME/bin/include -L$HOME/bin/include/ncurses -L$HOME/bin/lib"
make
make install
cd $TMP_DIR


# clean up
rm -rf ~/tmp_tmux


echo "============================================================================"
echo "============================================================================"
echo "============================================================================"
echo "tmux is ready for use. Add $HOME/bin into your \$PATH"
echo "'which tmux' is to check which tmux you are using."
echo "'tmux -V' is to check the version you are using."

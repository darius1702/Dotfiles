#!/usr/bin/env bash
set -xe

CONFIG_FLAGS="--with-native-compilation=aot --with-tree-sitter --with-cairo --with-json"

echo "==== Cloning emacs ===="

mkdir -p ~/Software/emacs/

[ -d ~/Software/emacs/ ] && echo "[INFO] emacs was cloned already, skipping..." || git clone https://git.savannah.gnu.org/cgit/emacs.git ~/Software/emacs/

cd ~/Software/emacs/

echo "==== Running autogen.sh ===="
sh ~/Software/emacs/autogen.sh

echo "==== Running configure.sh ===="
echo "= Configure flags: $CONFIG_FLAGS ="
sh ~/Software/emacs/configure $CONFIG_FLAGS

echo "==== Running make ===="
make -j$(nproc)

echo "==== Now run sudo make install ===="

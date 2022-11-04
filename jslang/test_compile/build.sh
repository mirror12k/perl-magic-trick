#!/bin/sh

git clone https://github.com/nodejs/node.git
cd node
git checkout v14.21.0
./configure --shared
make -j4
make install

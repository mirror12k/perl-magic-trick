#!/bin/sh

make clean && rm -rf libcode.so auto
g++ code.c -I/usr/local/include/node/ -L/usr/local/lib/ -L/usr/lib/x86_64-linux-gnu/ -luv -lnode -shared -o libcode.so -Wl,-rpath,/usr/local/lib/ -fPIC
perl Makefile.PL
make
mv blib/arch/auto/ .
make clean
./test.pl


mv -f libcode.so ..
mv -f auto ..


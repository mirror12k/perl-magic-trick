
ln -s /usr/lib/x86_64-linux-gnu/libuv.so.1 /usr/lib/x86_64-linux-gnu/libuv.so
ln -s /usr/local/lib/libnode.so.83 /usr/local/lib/libnode.so
g++ -I/usr/local/include/node/ test.c -L/usr/local/lib/ -L/usr/lib/x86_64-linux-gnu/ -luv -lnode -otest -Wl,-rpath,/usr/local/lib/
./test


# trying stuff
g++ -c code.c -I/usr/local/include/node/ -o code.o
perl Makefile.PL
make
mv blib/arch/auto/ .
./test.pl


# more stuff?
make clean && rm -rf libcode.so auto
g++ code.c -I/usr/local/include/node/ -L/usr/local/lib/ -L/usr/lib/x86_64-linux-gnu/ -luv -lnode -shared -o libcode.so -Wl,-rpath,/usr/local/lib/ -fPIC
perl Makefile.PL
make
mv blib/arch/auto/ .
make clean
./test.pl


# finalizing
export PERL5LIB="."
cd node && make install
apt install nodejs





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
cd node && make install && cd ..

apt install nodejs
apt install python3 python3-dev libpython3.10-dev
apt install openjdk-17-jdk



cd javalang/pulljni
perl Makefile.PL
make
mv blib/arch/auto/ ..
make clean
cd ../..

cd pythonlang/pullpython
perl Makefile.PL
make
mv blib/arch/auto/ ..
make clean
cd ../..

cd jslang/pullnode
make clean && rm -rf libcode.so auto
g++ code.c -I/usr/local/include/node/ -L/usr/local/lib/ -L/usr/lib/x86_64-linux-gnu/ -luv -lnode -shared -o libcode.so -Wl,-rpath,/usr/local/lib/ -fPIC
perl Makefile.PL
make
mv blib/arch/auto/ ..
make clean
cd ../..



mkdir example
mkdir example/jbuild
mkdir example/auto

cd example
cp ../clang/CLang.pm .

mv ../javalang/auto/* auto/
cp ../javalang/JavaLang.pm .

mv ../pythonlang/auto/* auto/
cp ../pythonlang/PythonLang.pm .

mv ../jslang/auto/* auto/
cp ../jslang/JavaScript.pm .


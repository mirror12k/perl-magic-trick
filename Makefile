


build_all: build_java build_python build_javascript



build_node:
	cd node && make install

build_java:
	-cd javalang && rm -rf auto
	cd javalang/pulljni && perl Makefile.PL
	cd javalang/pulljni && make
	cd javalang/pulljni && mv blib/arch/auto/ ..
	cd javalang/pulljni && make clean

build_python:
	-cd pythonlang && rm -rf auto
	cd pythonlang/pullpython && perl Makefile.PL
	cd pythonlang/pullpython && make
	cd pythonlang/pullpython && mv blib/arch/auto/ ..
	cd pythonlang/pullpython && make clean

build_javascript:
	-cd jslang && rm -rf auto
	-cd jslang/pullnode && make clean & rm -rf libcode.so auto
	-ln -s /usr/lib/x86_64-linux-gnu/libuv.so.1 /usr/lib/x86_64-linux-gnu/libuv.so
	-ln -s /usr/local/lib/libnode.so.83 /usr/local/lib/libnode.so
	cd jslang/pullnode && g++ code.c -I/usr/local/include/node/ -L/usr/local/lib/ -L/usr/lib/x86_64-linux-gnu/ -luv -lnode -shared -o libcode.so -Wl,-rpath,/usr/local/lib/ -fPIC
	cd jslang/pullnode && perl Makefile.PL
	cd jslang/pullnode && make
	cd jslang/pullnode && mv blib/arch/auto/ ..
	cd jslang/pullnode && make clean


check:
	export PERL5LIB="."
	cd clang && ./test.pl
	cd javalang && ./test.pl
	cd pythonlang && ./test.pl
	cd jslang && ./test.pl

setup_example:
	-rm -rf example

	mkdir example
	mkdir example/jbuild
	mkdir example/auto

	cd example
	cp clang/C.pm example

	mv javalang/auto/* example/auto/
	cp javalang/Java.pm example

	mv pythonlang/auto/* example/auto/
	cp pythonlang/Python.pm example

	mv jslang/auto/* example/auto/
	cp jslang/JavaScript.pm example


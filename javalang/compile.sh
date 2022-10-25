#!/bin/sh

javac MyClass.java
gcc -I/usr/lib/jvm/java-1.17.0-openjdk-amd64/include -I/usr/lib/jvm/java-1.17.0-openjdk-amd64/include/linux includejni.c -o includejni -L/usr/lib/jvm/java-1.17.0-openjdk-amd64/lib/server/ -ljvm

env LD_LIBRARY_PATH=/usr/lib/jvm/java-1.17.0-openjdk-amd64/lib/server/ ./includejni




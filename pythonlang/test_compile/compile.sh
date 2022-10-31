#!/bin/sh

gcc includepy.c $(python3.8-config --cflags) $(python3.8-config --ldflags) -fPIE -lpython3.8 -o includepy

./includepy


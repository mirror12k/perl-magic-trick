#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';



use CLang;
#include <stdio.h>

void somefun() {
    printf("somefun is running...\n");
    for (int i = 0; i < 5; i++) {
	    printf("my i: %d\n", i);
    }
}


int funny() {
	return 31337;
}

no CLang;


ccode::somefun();
say "my num: ", ccode::funny();


#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';



use C;
#include <stdio.h>

void somefun() {
    printf("somefun from the c language is running...\n");
    for (int i = 0; i < 5; i++) {
	    printf("my i: %d\n", i);
    }
}


int funny() {
	return 31337;
}

no C;


c::somefun();
say "my num: ", c::funny();


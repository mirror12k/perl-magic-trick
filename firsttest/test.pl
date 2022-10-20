#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';



use LangFilter;

#include <stdio.h>

MODULE = asdf

void main(SV * sv) {
	printf("hello world\n");
}

no LangFilter;


say "hello!";


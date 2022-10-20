#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';

require XSLoader;

XSLoader::load('one');

say one::somefun(1);


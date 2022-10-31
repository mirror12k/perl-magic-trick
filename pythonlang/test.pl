#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';


say 'wat';
use PythonLang;

def hello_world(who):
    print('this is my function:', who)
    print('there are many like it')
    print('but this one is mine')

no PythonLang;

say "done";




use PythonLang;

for i in range(5):
    hello_world(i)

no PythonLang;



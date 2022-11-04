#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';


say 'wat';
use PythonLang;

import sys

def hello_world(who):
    print('this is my function:', who)
    print('there are many like it')
    print('but this one is mine')

no PythonLang;

say "done";


python::hello_world('asdf');
python::hello_world('troop');
python::hello_world(5);

use PythonLang;

for i in range(5):
    hello_world(i)

no PythonLang;



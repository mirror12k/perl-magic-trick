#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';


say 'wat';
use Python;

import sys

print('running with python!')
def hello_world(who):
    print('this is my function:', who)
    print('there are many like it')
    print('but this one is mine')

no Python;

say "done";


python::hello_world('asdf');
python::hello_world('troop');
python::hello_world(5);

use Python;

for i in range(5):
    hello_world(i)

no Python;



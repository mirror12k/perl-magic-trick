#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';


require XSLoader;

XSLoader::load('pylangintegrator');

pylangintegrator::init_python();
pylangintegrator::execute_python_string(q/
def hello_world():
	print('this is my function')
	print('there are many like it')
	print('but this one is mine')


hello_world()
hello_world()
hello_world()
hello_world()

/);

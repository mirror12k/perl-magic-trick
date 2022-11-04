#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';


require XSLoader;

XSLoader::load('jslangintegrator');

jslangintegrator::init_js_vm();
jslangintegrator::execute_js_code(q/
console.log('hello world!!!!');


function this_is_js(i) {
	console.log("js sucks:", { i: i });
}

this_is_js(1337);

/);

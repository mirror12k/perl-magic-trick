#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';


require XSLoader;

XSLoader::load('jlangintegrator');

jlangintegrator::init_jvm();
jlangintegrator::call_jvm_class_method('MyClass', 'greet', 'jlang says hi');

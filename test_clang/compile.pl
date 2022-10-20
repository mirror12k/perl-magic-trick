#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';



sub writefile { IO::File->new(shift, 'w')->write(shift); }





my $code = q/

#include <stdio.h>

void somefun(SV * sv) {
    printf("something about my time: %ld\n", time(0));
}

/;


my $xs_prefix = q@
#define PERL_NO_GET_CONTEXT // we'll define thread context if necessary (faster)
#include "EXTERN.h"         // globals/constant import locations
#include "perl.h"           // Perl symbols, structures and constants definition
#include "XSUB.h"           // xsubpp functions and macros

#include "fun.c"

MODULE = ccode  PACKAGE = ccode
PROTOTYPES: ENABLE

 # XS code goes here

 # XS comments begin with " #" to avoid them being interpreted as pre-processor
 # directives
@;

my $makefilepl = q@
use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  NAME           => 'ccode',
  PREREQ_PM      => { 'ExtUtils::MakeMaker' => '7.12' },
  CCFLAGS        => '-Wall -std=c99',
  OPTIMIZE       => '-O3',
  XSMULTI        => 1,
);
@;




my $xs_code = $xs_prefix . ($code =~ s/\{[^{}]*?\}//grs =~ s/^#.+\n//grm);


mkdir 'build';
say `rm -rf build/* auto`;

writefile('build/fun.c', $code);
writefile('build/ccode.xs', $xs_code);
writefile('build/Makefile.PL', $makefilepl);
writefile('build/ccode.pm', q@
package ccode;
BEGIN { our $VERSION = 0.01 }
1;
@);


say `cd build && perl Makefile.PL`;
say `cd build && make`;
say `mv build/blib/arch/auto/ .`;




require XSLoader;

XSLoader::load('ccode');

say ccode::somefun(1);




package C;
use strict;
use warnings;

use feature 'say';

sub writefile { IO::File->new(shift, 'w')->write(shift); }

sub compile_ccode {

	my $code = shift // die;
	# my $code = q/

	# #include <stdio.h>

	# void somefun(SV * sv) {
	#     printf("something about my time: %ld\n", time(0));
	# }

	# /;


	my $xs_prefix = q@
#define PERL_NO_GET_CONTEXT // we'll define thread context if necessary (faster)
#include "EXTERN.h"         // globals/constant import locations
#include "perl.h"           // Perl symbols, structures and constants definition
#include "XSUB.h"           // xsubpp functions and macros

#include "fun.c"

MODULE = c  PACKAGE = c
PROTOTYPES: ENABLE

 # XS code goes here

 # XS comments begin with " #" to avoid them being interpreted as pre-processor
 # directives
@;

	my $makefilepl = q@
use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option

WriteMakefile(
  NAME           => 'c',
  PREREQ_PM      => { 'ExtUtils::MakeMaker' => '7.12' },
  CCFLAGS        => '-Wall -std=c99',
  OPTIMIZE       => '-O3',
  XSMULTI        => 1,
);
@;




	my $xs_code = $xs_prefix . ($code =~ s/\{([^{}]|\{([^{}]|\{[^{}]*?\})*?\})*?\}//grs =~ s/^#.+\n//grm);


	mkdir 'build';
	`rm -rf build/* auto/c`;

	writefile('build/fun.c', $code);
	writefile('build/c.xs', $xs_code);
	writefile('build/Makefile.PL', $makefilepl);
	writefile('build/c.pm', q@
package c;
BEGIN { our $VERSION = 0.01 }
1;
@);


	if ($CLang::debug) {
		say `cd build && perl Makefile.PL`;
		say `cd build && make`;
		say `mv build/blib/arch/auto/* auto/`;
	} else {
		`cd build && perl Makefile.PL`;
		`cd build && make`;
		`mv build/blib/arch/auto/* auto/`;
		`rm -rf build`;
	}


	require XSLoader;

	XSLoader::load('c');

	# say ccode::somefun();
}


use Filter::Simple sub {
	compile_ccode($_);
	$_ = '';
};



1;

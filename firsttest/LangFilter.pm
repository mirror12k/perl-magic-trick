package LangFilter;
require DynaLoader;

use feature 'say';

sub writefile { IO::File->new(shift, 'w')->write(shift); }


use Filter::Simple sub {
	s/hello/goodbye/g;

	my $code = qq/
#include <perl.h>
#include <XSUB.h>

$_
/;

	writefile('test.c', $code);
	say `gcc -shared test.c -o test.so`;
	my $lib = DynaLoader::dl_load_file('test.so', 0x1);
	my $sym = DynaLoader::dl_find_symbol($lib, 'main');

	my $fun = DynaLoader::dl_install_xsub("asdf::main", $sym);

	say "fun: $fun";
	$fun->();

	say "symbol: $_" foreach @symbols;

	$_ = '';
};



1;

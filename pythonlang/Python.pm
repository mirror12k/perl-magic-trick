package Python;
use strict;
use warnings;

use feature 'say';



require XSLoader;

XSLoader::load('pylangintegrator');
pylangintegrator::init_python();



sub compile_python_code {

	my $code = shift // die;


	foreach my $function ($code =~ /^def\s+(\w+)\s*\(/gm) {
		eval qq/sub ::python::$function {
			pylangintegrator::execute_python_function('$function', \$_[0]);
		}/;
		say $@ if $@;
	}

	return "pylangintegrator::execute_python_string(q\@$code\@);";


}


use Filter::Simple sub {
	$_ = compile_python_code($_);
};



1;
